//
//  HX_User.h
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/17.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HX_User : NSObject
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic)NSInteger company_id;
@property(nonatomic)NSInteger ids;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *position;
@property(nonatomic,strong)NSDictionary *priv;
@property(nonatomic)NSInteger sid;
@property(nonatomic)NSInteger uid;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,strong)NSDictionary *wsq;
@end
