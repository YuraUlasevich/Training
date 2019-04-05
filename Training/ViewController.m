//
//  ViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/4/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
}

- (void) handleEndEditing{
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
//    NSString* patterForLogin = @"[a-z]{6,20}";
//    NSString* patterForPassword = @"[a-z0-9]{6,20}";
//    NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
//    NSError*  errorLogin = NULL;
//    NSError*  errorPassword = NULL;
//    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patterForLogin options:regexOptions error:&errorLogin];
//    NSArray *matchs = [regex matchesInString:_loginTextField.text options:regexOptions
//                                       range:NSMakeRange(0, _loginTextField.text.length)];
//    if(errorLogin){
//        _loginTextField.layer.borderColor = [UIColor redColor].CGColor;
//        _loginTextField.layer.borderWidth = 3.0f;
//    }
//    if(errorPassword){
//        _passwordTextField.layer.borderColor = [UIColor redColor].CGColor;
//        _passwordTextField.layer.borderWidth = 3.0f;
//    }
    if(![_loginTextField.text isEqual:@"adminn"] && ![_passwordTextField.text isEqual:@"password"]){
        _loginTextField.layer.borderColor = [UIColor redColor].CGColor;
        _loginTextField.layer.borderWidth = 3.0f;
        _passwordTextField.layer.borderColor = [UIColor redColor].CGColor;
        _passwordTextField.layer.borderWidth = 3.0f;
    }
}
@end
