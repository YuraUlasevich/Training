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
@property (nonatomic, strong) NSString * userEmail;
@property (nonatomic, strong) NSString * userPassword;


@end

NS_ASSUME_NONNULL_END
