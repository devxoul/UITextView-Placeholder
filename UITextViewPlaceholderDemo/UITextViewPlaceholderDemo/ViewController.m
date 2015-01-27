//
//  ViewController.m
//  UITextViewPlaceholderDemo
//
//  Created by 전수열 on 12/10/14.
//  Copyright (c) 2014 Suyeol Jeon. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+Placeholder.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _textView.placeholder = @"How are you?";
}

@end
