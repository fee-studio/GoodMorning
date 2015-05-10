//
// Created by efeng on 15/4/7.
// Copyright (c) 2015 yunniao. All rights reserved.
//
// 支持JS通信的WebView

#import <UIKit/UIKit.h>


@interface EEBaseWebViewController : EEBaseViewController <UIWebViewDelegate>


@property(nonatomic, strong) UIWebView *baseWebView;

@property(nonatomic, strong) WebViewJavascriptBridge *bridge;


@end