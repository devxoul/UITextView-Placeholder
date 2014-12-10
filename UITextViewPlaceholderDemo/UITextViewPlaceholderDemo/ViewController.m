//
//  ViewController.m
//  UITextViewPlaceholderDemo
//
//  Created by 전수열 on 12/10/14.
//  Copyright (c) 2014 Suyeol Jeon. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+Placeholder.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    textView.placeholder = @"How are you?";
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
}

@end
