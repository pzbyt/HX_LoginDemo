//
//  HX_ReturnUserInfo.h
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/17.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HX_Data.h"
@interface HX_ReturnUserInfo : NSObject
@property(nonatomic,strong)NSDictionary *data;
@property(nonatomic,copy)NSString *info;
@property(nonatomic)NSInteger iRet;

//@property(nonatomic,strong)HX_Data *hx_Data;
//- (instancetype)inithx_DataWithDic:(NSDictionary *)dic;
@end
