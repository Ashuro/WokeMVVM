//
//  MUser.h
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MUser : JSONModel
@property (nonatomic,strong)NSString * birthday;
@property (nonatomic,strong)NSString * city;
@property (nonatomic,strong)NSString * cityCode;
@property (nonatomic,strong)NSString * clientOsType;
@property (nonatomic,strong)NSString * district;
@property (nonatomic,strong)NSString * districtCode;
@property (nonatomic,assign)BOOL       hasIdentityStatus;
@property (nonatomic,assign)BOOL       hasPayment;
@property (nonatomic,assign)NSInteger  id;
@property (nonatomic,assign)NSInteger  identityAuditStatus;
@property (nonatomic,strong)NSString * identityCode;
@property (nonatomic,assign)NSInteger  identityStatus;
@property (nonatomic,strong)NSString * identityStatusDesc;
@property (nonatomic,strong)NSString * invitationCode;
@property (nonatomic,strong)NSString * lastLoginTime;
@property (nonatomic,strong)NSString * mobile;
@property (nonatomic,strong)NSString * name;
@property (nonatomic,strong)NSString * nickname;
@property (nonatomic,assign)double     posLatitude;
@property (nonatomic,assign)double     pos_longitude;
@property (nonatomic,strong)NSString * province;
@property (nonatomic,strong)NSString * provinceCode;
@property (nonatomic,strong)NSString * regClientType;
@property (nonatomic,strong)NSString * regdate;
@property (nonatomic,assign)NSInteger  resumeCompletionPercentage;
@property (nonatomic,assign)NSInteger  sex;
@property (nonatomic,strong)NSString * sexDesc;
@property (nonatomic,strong)NSString * signature;
@property (nonatomic,assign)BOOL       undergraduate;
@property (nonatomic,strong)NSString * undergraduateDesc;
@property (nonatomic,assign)long long  updateLongTime;
@property (nonatomic,assign)NSInteger  userStatus;
@property (nonatomic,strong)NSString * userStatusDesc;
@property (nonatomic,strong)NSString * username;
@property (nonatomic,assign)NSInteger  verifyStatus;
@property (nonatomic,strong)NSString * verifyStatusDesc;
@end
