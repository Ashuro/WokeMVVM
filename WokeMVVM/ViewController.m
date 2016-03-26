//
//  ViewController.m
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//



#import "ViewController.h"
#import "VUser.h"

@interface ViewController ()
@property (nonatomic,strong)NSString * un;
@property (nonatomic,strong)NSString * ps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.username.rac_textSignal subscribeNext:^(NSString * username) {
//        
//        self.un  = username;
//    }];
    
    [[self.username.rac_textSignal filter:^BOOL(NSString * value) {
        if (value.length > 11) {
            return NO;
        }
        return YES;
    }] subscribeNext:^(NSString *  x) {
        self.un = x;
    }];
    
    [self.password.rac_textSignal subscribeNext:^(NSString * password) {
        self.ps = password;
    }];

    
    [[RACSignal combineLatest:@[self.username.rac_textSignal,self.password.rac_textSignal] reduce:^id(NSString * username,NSString * password){
        if (username.length>10 && password.length>=6) {
            return @(YES);
        }
        else
            return @(NO);
    }]subscribeNext:^(NSNumber * boolNumber) {
        self.loginBtn.enabled = [boolNumber boolValue];
    }];
    
    
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [[VUser loginWithUserName:self.un andPassword:self.ps]subscribeNext:^(id x) {

            NSLog(@"%@",x);
        }];

    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
