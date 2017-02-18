//
//  HX_MainController.m
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/16.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import "HX_MainController.h"
#import "HX_LoginController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "HX_ReturnUserInfo.h"
@interface HX_MainController ()

@property(nonatomic,strong)HX_ReturnUserInfo *returnInfo;
@end

@implementation HX_MainController

- (HX_ReturnUserInfo *)returnInfo {
    if (_returnInfo == nil) {
        _returnInfo = [[HX_ReturnUserInfo alloc] init];
    }
    return _returnInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@" just testing! ");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self userWhetherLogined];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HX_LoginController *login = [[HX_LoginController alloc] init];
    [self.navigationController presentViewController:login animated:YES completion:nil];
}

#pragma mark -- 判断当前用户是否登录
- (BOOL)userWhetherLogined {
    HX_ReturnUserInfo* returnInfo = [self currentUserInfo];
    if (returnInfo.iRet) {
        return YES;
    }else {
        HX_LoginController *login = [[HX_LoginController alloc] init];
        [self.navigationController presentViewController:login animated:YES completion:nil];
        return NO;
    }
}

#pragma mark -- 获取当前用户信息
- (HX_ReturnUserInfo *)currentUserInfo {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"USERINFO"];
    HX_ReturnUserInfo* returnInfo = [HX_ReturnUserInfo mj_objectWithKeyValues:dic];
    return returnInfo;
}

@end
