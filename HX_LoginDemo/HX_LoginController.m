//
//  ViewController.m
//  HX_LoginDemo
//
//  Created by 彭章博 on 17/2/16.
//  Copyright © 2017年 彭章博. All rights reserved.
//

#import "HX_LoginController.h"
#import "Masonry.h"
#import "HX_CustomCell.h"
#import "IQUIView+Hierarchy.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "HX_UserInfo.h"
#import "HX_ReturnUserInfo.h"
#import "HX_Data.h"
#import "HX_User.h"
@interface HX_LoginController ()<UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *containerView;

@property(nonatomic,strong)UIButton *timesbtn;
@property(nonatomic,strong)UIImageView *logoImgView;

@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UITableView *mainTableview;
@property(nonatomic,strong)UIView *footer;

@property(nonatomic,strong)NSArray *imgNamesArray;
@property(nonatomic,strong)NSArray *placeHoldersArray;
@property(nonatomic,strong)NSArray *tagsArray;

@property(nonatomic,strong)HX_UserInfo *userInfo;

@property(nonatomic,strong)HX_ReturnUserInfo *returnInfo;
@property(nonatomic,strong)HX_Data *data;
@property(nonatomic,strong)HX_User *user;
@end

#define CellHeight (88/2 * autoSizeScaleH_Only6P)
#define LoginbtnHeight (88/2 * autoSizeScaleH_Only6P)
#define LoginbtnWidth (690/2 * autoSizeScaleX_Only6P)
//  15590284393
//  123456
static NSString *URL = @"http://college.halobear.com/api/loginphone=%@&password=%@";
@implementation HX_LoginController

#pragma mark -- property
- (HX_UserInfo *)userInfo {
    if (_userInfo == nil) {
        _userInfo = [[HX_UserInfo alloc] init];
    }
    return _userInfo;
}

//  model
- (HX_ReturnUserInfo *)returnInfo {
    if (_returnInfo == nil) {
        _returnInfo = [[HX_ReturnUserInfo alloc] init];
    }
    return _returnInfo;
}

- (HX_Data *)data {
    if (_data == nil) {
        _data = [[HX_Data alloc] init];
    }
    return _data;
}

- (HX_User *)user {
    if (_user == nil) {
        _user = [[HX_User alloc] init];
    }
    return _user;
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    return _scrollView;
}

- (UIView *)containerView {
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

- (UIButton *)timesbtn {
    if (_timesbtn == nil) {
        _timesbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _timesbtn.backgroundColor = [UIColor clearColor];
        [_timesbtn setImage:[UIImage imageNamed:@"times"] forState:UIControlStateNormal];
        [_timesbtn addTarget:self action:@selector(dismissClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timesbtn;
}

- (UIImageView *)logoImgView {
    if (_logoImgView == nil) {
        _logoImgView = [[UIImageView alloc] init];
        _logoImgView.backgroundColor = [UIColor clearColor];
        _logoImgView.image = [UIImage imageNamed:@"icon"];
    }
    return _logoImgView;
}

- (NSArray *)imgNamesArray {
    if (_imgNamesArray == nil) {
        _imgNamesArray = [[NSArray alloc] initWithObjects:@"user", @"password", nil];
    }
    return _imgNamesArray;
}

- (NSArray *)placeHoldersArray {
    if (_placeHoldersArray == nil) {
        _placeHoldersArray = [[NSArray alloc] initWithObjects:@"请输入您的手机号", @"请输入您的密码", nil];
    }
    return _placeHoldersArray;
}

- (NSArray *)tagsArray {
    if (_tagsArray == nil) {
        _tagsArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:UserInfoTypeWithAccount],
                      [NSNumber numberWithInteger:UserInfoTypeWithPassword],
                      nil];
    }
    return _tagsArray;
}

- (UIView *)header {
    if (_header == nil) {
        _header = [[UIView alloc] init];
        _header.backgroundColor = [UIColor clearColor];

        [_header addSubview:self.timesbtn];
        [_header addSubview:self.logoImgView];
        CGSize btnSize = [self getImageSizeWithImg:[UIImage imageNamed:@"times"]];
        [self.timesbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_header.mas_top).offset(20 + 30/2 * autoSizeScaleH_Only6P);
            make.right.equalTo(_header.mas_right).offset(- (30/2 * autoSizeScaleX_Only6P));
            make.size.mas_equalTo(btnSize);
        }];

        CGSize logoSize = [self getImageSizeWithImg:[UIImage imageNamed:@"icon"]];
        [self.logoImgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_header.mas_centerX);
            make.centerY.equalTo(_header.mas_centerY).offset(20);
            make.size.mas_equalTo(logoSize);
        }];
    }
    return _header;
}

- (UITableView *)mainTableview {
    if (_mainTableview == nil) {
        _mainTableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTableview.delegate = self;
        _mainTableview.dataSource = self;
        _mainTableview.backgroundColor = [UIColor clearColor];
        _mainTableview.layer.cornerRadius = 6;
        _mainTableview.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _mainTableview.layer.borderWidth = 0.7;
    }
    return _mainTableview;
}

- (UIView *)footer {
    if (_footer == nil) {
        _footer = [[UIView alloc] init];
        _footer.backgroundColor = [UIColor clearColor];

        // login btn
        UIButton *loginbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginbtn setTitle:@"登录" forState:UIControlStateNormal];
        loginbtn.titleLabel.font = [UIFont systemFontOfSize:16];
        loginbtn.backgroundColor = [UIColor orangeColor];
        loginbtn.layer.cornerRadius = 6;
        loginbtn.userInteractionEnabled = YES;
        [loginbtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        [_footer addSubview:loginbtn];

        [loginbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_footer.mas_top);
            make.centerX.equalTo(_footer.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(LoginbtnWidth, LoginbtnHeight));
        }];
    }
    return _footer;
}

#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self addViews];
}

- (void)addViews {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.containerView];
    [self.containerView addSubview:self.header];
    [self.containerView addSubview:self.mainTableview];
    [self.containerView addSubview:self.footer];

    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        // 确定containerView的宽度
        make.width.equalTo(self.scrollView);
    }];

    [self.header mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.containerView);
        make.height.equalTo(@250);
    }];

    [self.mainTableview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.header.mas_bottom);
        make.left.equalTo(self.containerView.mas_left).offset(30/2 * autoSizeScaleX_Only6P);
        make.right.equalTo(self.containerView.mas_right).offset(-(30/2 * autoSizeScaleX_Only6P));
        make.height.equalTo(@(CellHeight * 2));
    }];

    [self.footer mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainTableview.mas_bottom).offset(30);
        make.left.right.equalTo(self.containerView);
        make.height.equalTo(@100);
        make.bottom.equalTo(self.containerView);
    }];

    [super updateViewConstraints];
}

#pragma mark -- public method
- (CGSize)getImageSizeWithImg:(UIImage *)img {
    return img.size;
}

#pragma mark --    UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"CustomCell";
    HX_CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[HX_CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.txtField.delegate = self;
        /** ios7 才有的属性 */
        cell.separatorInset = UIEdgeInsetsZero;
    }
    cell.txtField.tag = [self.tagsArray[indexPath.row] integerValue];
    cell.imgName = self.imgNamesArray[indexPath.row];
    cell.txtField.placeholder = self.placeHoldersArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.txtField.secureTextEntry = NO;
        cell.txtField.keyboardType = UIKeyboardTypeNumberPad;
    }else {
        cell.txtField.secureTextEntry = YES;
        cell.txtField.keyboardType = UIKeyboardTypeDefault;
    }
    return cell;
}

#pragma mark --  UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    switch (textField.tag) {
        case UserInfoTypeWithAccount:
        {
            if (textField.isAskingCanBecomeFirstResponder == NO) {
                NSLog(@"%@" , textField.text);
                self.userInfo.phoneNum = textField.text;
            }
        }
            break;

        case UserInfoTypeWithPassword:
        {
            if (textField.isAskingCanBecomeFirstResponder == NO) {
                NSLog(@"%@" , textField.text);
                self.userInfo.password = textField.text;
            }
        }
            break;

        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- UIButton action
- (void)dismissClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loginClick {
    //  15590284393
    //  123456
    [self userLogin];
}

- (BOOL)validateUserInfo {
    if (!self.userInfo.phoneNum.length || self.userInfo.phoneNum.length < 11) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请输入有效手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    if (!self.userInfo.password.length) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请输入密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    return YES;
}


#pragma mark --------------  用户登录
- (void)userLogin {
    if ([self validateUserInfo]) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        NSString *url = [NSString stringWithFormat:@"http://college.halobear.com/api/login?phone=%@&password=%@" , self.userInfo.phoneNum , self.userInfo.password];
        [manager GET:url
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 self.returnInfo = [HX_ReturnUserInfo mj_objectWithKeyValues:responseObject];
                 if (self.returnInfo.iRet) {
                     self.data = [HX_Data mj_objectWithKeyValues:self.returnInfo.data];
                     self.user = [HX_User mj_objectWithKeyValues:self.data.user];
                     // 保存用户信息
                     [self saveUserInfo:responseObject];
                     [self dismissViewControllerAnimated:YES completion:nil];
                 }
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@" 错误信息1 :  %@" , error);  //这里打印错误信息
             }];
    }
}

- (void)saveUserInfo:(NSDictionary *)dic {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dic forKey:@"USERINFO"];
}

@end
