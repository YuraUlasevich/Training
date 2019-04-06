//
//  RegisterController.h
//  Training
//
//  Created by Юра Уласевич on 4/6/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondNameRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginRegisterTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordRegisterTextField;


@end

NS_ASSUME_NONNULL_END
