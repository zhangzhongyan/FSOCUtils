//
//  FSViewController.m
//  FSOCUtils
//
//  Created by 张忠燕 on 06/17/2022.
//  Copyright (c) 2022 张忠燕. All rights reserved.
//

#import "FSViewController.h"
#import <FSOCUtils/FSCountDownUtils.h>
#import <FSOCUtils/FSAESEncrypUtils.h>

@interface FSViewController ()

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    FSCountDownUtils.share.countDownChangeBlock = ^(NSUInteger countDown) {
        NSLog(@"%ld", countDown);
    };
    
    [[FSCountDownUtils share] startCountDownWithCount:60];
    
    [FSAESEncrypUtils encryptWithString:@"123" key:@"12345678901234567890123456789023"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
