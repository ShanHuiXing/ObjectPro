//
//  LoginUserModel.m
//  TigoFood
//
//  Created by linxiao song on 15/1/29.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import "LoginUserModel.h"


@implementation LoginUserModel

-(void)setGender:(NSString *)gender
{
    _gender = gender;
    if ([_gender intValue]==0)
    {
        _sex = @"女";
    }else if ([_gender intValue]==1)
    {
        _sex = @"男";
    }
}

-(void)setSex:(NSString *)sex
{
    _sex = sex;
}


-(id)initWithCoder:(NSCoder *)aDecoder//从coder中读取数据，保存到相应的变量中，即反序列化数据
{
    self = [super init];
    if (self)
    {
        self.account = [aDecoder decodeObjectForKey:@"account"];
        self.userId = [aDecoder decodeObjectForKey:@"userId"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.realName = [aDecoder decodeObjectForKey:@"realName"];
        self.orgId = [aDecoder decodeObjectForKey:@"orgId"];
        self.orgName = [aDecoder decodeObjectForKey:@"orgName"];

    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder// 读取实例变量，并把这些数据写到coder中去。序列化数据
{
    [aCoder encodeObject:_account forKey:@"account"];
    [aCoder encodeObject:_userId forKey:@"userId"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_gender forKey:@"gender"];
    [aCoder encodeObject:_sex forKey:@"sex"];
    [aCoder encodeObject:_realName forKey:@"realName"];
    [aCoder encodeObject:_orgId forKey:@"orgId"];
    [aCoder encodeObject:_orgName forKey:@"orgName"];
}



@end
