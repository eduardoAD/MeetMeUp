//
//  WebViewController.m
//  MeetMeUp
//
//  Created by Eduardo Alvarado Díaz on 10/13/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

@end
