//
//  User.m
//  Training
//
//  Created by Юра Уласевич on 4/5/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userLogin;

+(void) addUser:(NSString *)withFirstName andSecondName:(NSString *)secondName andLogin:(NSString *)login{
    
    User *user = [[User alloc] init];
    user.userFirstName = withFirstName;
    user.userSecondName = secondName;
    user.userLogin = login;
    //user.userID = userID;
    
}

@end
