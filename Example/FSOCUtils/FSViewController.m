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
#import <FSOCUtils/FSDESEncrypUtils.h>
#import <FSOCUtils/FSSafeUtils.h>
#import <FSOCUtils/FSSizeScaleUtils.h>

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
    
    NSString *orginTexg = @"11870469643066082825255382745106";
    NSString *key = @"fulelianmishiyeyaoshangc";
    NSString *encryText = [FSDESEncrypUtils encryptWithString:orginTexg key:key];
    NSString *decryText = [FSDESEncrypUtils decryptWithString:encryText key:key];

    NSLog(@"%@", encryText);
    NSLog(@"%@", decryText);
    
    CGFloat width = sizeCeilScaleX(30);


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
