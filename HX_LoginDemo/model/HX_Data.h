//
//  HX_Data.h
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/17.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HX_User.h"
@interface HX_Data : NSObject
@property(nonatomic,copy)NSString *avatar_token;
@property(nonatomic,copy)NSString *avatar_token_key;
@property(nonatomic,copy)NSString *token;
@property(nonatomic,strong)NSDictionary *user;
@property(nonatomic,strong)NSDictionary *wsq;

//@property(nonatomic,strong)HX_User *hx_User;
@end
