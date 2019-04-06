//
//  RegisterController.m
//  Training
//
//  Created by Юра Уласевич on 4/6/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerButtonPressed:(UIButton *)sender {
    NSString* patterForFirstName = @"[a-zа-я]{2,20}";
    NSString* patterForSecondName = @"[a-z-]{2,20}";
    NSString* patterForHeight = @"[0-9]{2,3}";
    NSString* patterForWeight = @"[0-9]{3}";
    NSString* patterForLogin = @"[a-zA-z0-9]{6-20}";
    NSString* patterForPassword = @"[a-z0-9]{6,20}";
    NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
    NSError*  errorFirstName = NULL;
    //    NSError*  errorPassword = NULL;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patterForFirstName options:regexOptions error:&errorFirstName];
    NSUInteger numberOfMatchesFirstName = [regex numberOfMatchesInString:_firstNameRegisterTextField.text
                                                        options:0
                                                          range:NSMakeRange(0, [_firstNameRegisterTextField.text length])];
    if(numberOfMatchesFirstName == 0){
        _firstNameRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _firstNameRegisterTextField.layer.borderWidth = 3.0f;
    }
}
@end
