//
//  HomeDetailViewController.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "Define.h"
#import "HomeDetailView.h"
#import "MBProgressHUD.h"
#import "Tools.h"
@interface HomeDetailViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)HomeDetailView *homeDetailView;
@end

@implementation HomeDetailViewController{
    MBProgressHUD *hud;
}

- (void)viewDidLoad {
    
//hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//hud.delegate = self;
   // if(!hud){
     //   [self.view addSubview:hud];
 //   }
    [super viewDidLoad];
    [self setTitle:_navTitle];
    [self.view setBackgroundColor:kAppMainBgColor];
    [self.view addSubview:self.homeDetailView];
}
-(void)viewWillAppear:(BOOL)animated{
    [Tools showHUD:@"施工中" andView:self.view andHUD:hud];
}
-(HomeDetailView *)homeDetailView{
    if(!_homeDetailView){
        _homeDetailView = [[HomeDetailView alloc]initWithFrame:self.view.bounds];
        [_homeDetailView setDelegate:self];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
        [_homeDetailView loadRequest:request];
    }
    return _homeDetailView;
}

#pragma mark -UIWebView delegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始加载");
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"完成加载");
   // hud.hidden = YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
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
