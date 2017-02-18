//
//  HX_CustomCell.m
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/16.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import "HX_CustomCell.h"
#import "Masonry.h"
@interface HX_CustomCell()<UITextFieldDelegate>

@end

@implementation HX_CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addViews];
    }
    return self;
}

- (void)addViews {
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.txtField];
}

- (void)setImgName:(NSString *)imgName {
    UIImage *img = [UIImage imageNamed:imgName];
    CGSize imgSize = [self getImageSizeWithImg:img];
    self.imgView.image = img;
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.size.mas_equalTo(imgSize);
    }];
    [self.txtField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(50);
        make.top.bottom.right.equalTo(self.contentView);
    }];
}

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor clearColor];
    }
    return _imgView;
}

- (UITextField *)txtField {
    if (_txtField == nil) {
        _txtField = [[UITextField alloc] init];
        _txtField.backgroundColor = [UIColor clearColor];
        _txtField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _txtField;
}

- (CGSize)getImageSizeWithImg:(UIImage *)img {
    return img.size;
}

@end
