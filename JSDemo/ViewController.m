//
//  ViewController.m
//  JSDemo
//
//  Created by 许伟杰 on 2018/6/13.
//  Copyright © 2018年 JackXu. All rights reserved.
//

#import "ViewController.h"
#import "AppJSObject.h"

@interface ViewController ()<AppJSObjectDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWeb];
}

-(void)loadWeb{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"scan" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_mainWebView loadRequest:request];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    AppJSObject *jsObject = [AppJSObject new];
    jsObject.delegate = self;
    context[@"app"] = jsObject;
}

//调用扫描二维码,并返回结果
- (void)scan:(NSString*)message{
    JSContext *context=[self.mainWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *alertJS= [NSString stringWithFormat:@"scanResult('%@')",@"我是扫描结果"];//准备执行的js代码
    [context evaluateScript:alertJS];//通过oc方法调用js
}



@end
