//
// Created by efeng on 15/4/7.
// Copyright (c) 2015 yunniao. All rights reserved.
//

#import "EEBaseWebViewController.h"


@implementation EEBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.baseWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _baseWebView.delegate = self;
    [_baseWebView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.view addSubview:_baseWebView];

    _bridge = [WebViewJavascriptBridge bridgeForWebView:_baseWebView webViewDelegate:self handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC received message from JS: %@", data);
        responseCallback(@"Response for message from ObjC");
    }];

    [_bridge registerHandler:@"pushViewController" handler:^(id data, WVJBResponseCallback responseCallback) {
//        YNAbandonTenderViewController *abandonVC = [[YNAbandonTenderViewController alloc] init];
//        abandonVC.tender = self.tender;
//        [self.navigationController pushViewController:abandonVC animated:YES];
    }];

}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

}


@end