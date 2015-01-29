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
    textView.placeholder = @"Are you sure you don\'t want to reconsider? Could you tell us why you wish to leave StyleShare? Your opinion helps us improve StyleShare into a better place for fashionistas from all around the world. We are always listening to our users. Help us improve!";
    textView.font = [UIFont systemFontOfSize:15];
    textView.textContainerInset = UIEdgeInsetsMake(10, 5, 10, 5);
    [self.view addSubview:textView];
}

@end
