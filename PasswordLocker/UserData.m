//
//  UserData.m
//  PasswordLocker
//
//  Created by David Jura on 12/11/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import "UserData.h"

@implementation UserData
@synthesize username,password,accountType,uid;

-(id) initWithAccount:(NSString *)user Password:(NSString *)pass AccountType:(NSString *)type UserID:(NSInteger)userid{
    self = [super init];
    username = user;
    password = pass;
    accountType = type;
    uid = userid;
    return self;
}

-(id) init{
    self = [super init];
    return self;
}

-(NSString *) getUsername{
    return username;
}

-(NSString *) getPassword{
    return password;
}

-(NSString *) getAccountType{
    return accountType;
}

-(NSInteger) getUID{
    return uid;
}

-(void) setUsername:(NSString *)user{
    username = user;
}

-(void) setPassword:(NSString *)pass{
    password = pass;
}

-(void) setAccountType:(NSString *)type{
    accountType = type;
}
-(void) setUserID:(NSInteger)userid{
    uid = userid;
}

@end
