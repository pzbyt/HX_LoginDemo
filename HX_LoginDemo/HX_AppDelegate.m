//
//  AppDelegate.m
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/16.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import "HX_AppDelegate.h"
#import "HX_UserInfo.h"
#import "HX_Data.h"
#import "HX_User.h"
#import "HX_LoginController.h"
@interface HX_AppDelegate ()
@property(nonatomic,strong)HX_UserInfo *userInfo;
@property(nonatomic,strong)HX_Data *hx_Data;
@property(nonatomic,strong)HX_User *hx_User;
@end

@implementation HX_AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    return YES;
}

//#pragma mark -- 判断当前用户是否登录
//- (BOOL)userWhetherLogined {
//    HX_User *userInfo = [self currentUserInfo];
//    if (userInfo.phone.length) {
//        return YES;
//    }else {
//        return NO;
//    }
//}
//
//#pragma mark -- 获取当前用户信息
//- (HX_User *)currentUserInfo {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.hx_User = [defaults objectForKey:@"USER"];
//    return self.hx_User;
//}

@end
