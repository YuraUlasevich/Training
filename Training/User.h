//
//  User.h
//  Training
//
//  Created by Юра Уласевич on 4/5/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString * userFirstName;
@property (nonatomic, strong) NSString * userSecondName;
@property (nonatomic, strong) NSString * userLogin;
@property (nonatomic, strong) NSNumber* userID;

+(void) addUser: (NSString*) withFirstName andSecondName: (NSString *) secondName andLogin: (NSString *) login;

@end

NS_ASSUME_NONNULL_END
