//
//  HomeViewController.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableView.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "Define.h"
#import "HomeDetailViewController.h"
#import "HomeViewModel.h"
#import "Tools.h"
#import "MBProgressHUD.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong) HomeTableView *homeTableView;

@end

@implementation HomeViewController{
    MBProgressHUD *hud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"ios头条"];
//    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    [self configNav];
    //布局View
    [self setUpView];
    //数据处理
    [self dataAccess];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [Tools showHUD:@"施工中" andView:self.view andHUD:hud];

}
#pragma mark DataAccess
-(void)dataAccess{
    HomeViewModel *homeViewModel = [[HomeViewModel alloc]init];
    
    __WeakSelf__ wSelf = self;
    [homeViewModel handleDataWithSuccess:^(NSArray *arr) {
        [wSelf.dataArr removeAllObjects];
        [wSelf.dataArr addObjectsFromArray:arr];
            dispatch_async(dispatch_get_main_queue(), ^{
                [wSelf.homeTableView reloadData];
            });
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
}

#pragma mark _UITableView delegate
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeModel *model = self.dataArr[indexPath.row];
    HomeDetailViewController *homeDetailVC = [[HomeDetailViewController alloc]init];
    [homeDetailVC setNavTitle:model.newsTitle];
    [homeDetailVC setUrlStr:model.newsLink];
    [self.navigationController pushViewController:homeDetailVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark -UITableView dataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIde = @"cellIde";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if(!cell){
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde];
    }
    [cell setData:self.dataArr[indexPath.row]];
    return cell;
}
-(void)configNav{
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setFrame:CGRectMake(0.0, 0.0, 23.0, 23.0)];
    [settingBtn setImage:[UIImage imageNamed:@"navigationbar_setting"] forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:settingBtn]];
}
#pragma mark - setUpView
-(void)setUpView{
    [self.view addSubview:self.homeTableView];
}

-(HomeTableView *)homeTableView{
    if (!_homeTableView) {
        _homeTableView = [[HomeTableView alloc]initWithFrame:self.view.bounds];
        [_homeTableView setDelegate:self];
        [_homeTableView setDataSource:self];
        [_homeTableView setRowHeight:80.0];
    }
    return _homeTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
