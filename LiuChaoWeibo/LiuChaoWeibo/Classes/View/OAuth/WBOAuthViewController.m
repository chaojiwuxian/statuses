//
//  WBOAuthViewController.m
//  LiuChaoWeibo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WBOAuthViewController.h"
#import <AFNetworking.h>

#define client_id      @"2749473729"
#define client_secret  @"895a0f3e5034ff56832a6746f1d9c9c8"
#define redirect_uri   @"http://www.baidu.com"

@interface WBOAuthViewController ()<UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation WBOAuthViewController

// 加载跟视图
- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.delegate = self;
    self.webView = webView;
    self.view = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"自动填充" style:UIBarButtonItemStylePlain target:self action:@selector(autoFill)];
    
    // webView 进行请求
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",client_id,redirect_uri];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //http://www.baidu.com/?code=68d47dcbe0e664fabf2238f3cdab0bae
   
    NSString *urlStr = request.URL.absoluteString;
    
    // 判断是否包含code= 获取code
    if ([urlStr containsString:@"code="]) {
        
        NSArray *arr = [urlStr componentsSeparatedByString:@"code="];
        
        NSString *code = arr.lastObject;
        
        NSLog(@"%@",code);
        
        // 用code去换取 token
        AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
        NSDictionary *dict = @{@"client_id": client_id,
                               @"client_secret": client_secret,
                               @"grant_type" : @"authorization_code",
                               @"code": code,
                               @"redirect_uri": redirect_uri};
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
        
        [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"%@",responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            
        }];
        
        return NO;
    }
    
    return YES;
}

// 自动填充
- (void)autoFill
{

}
// 退出界面
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
