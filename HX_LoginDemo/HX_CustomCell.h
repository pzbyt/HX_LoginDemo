//
//  HX_CustomCell.h
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/16.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HX_CustomCell : UITableViewCell
@property(nonatomic,copy)NSString *imgName;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UITextField *txtField;
@end
