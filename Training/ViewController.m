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
    if(![_loginTextField.text isEqual:@"admin"]){
        _loginTextField.layer.borderColor = [UIColor redColor].CGColor;
        _loginTextField.layer.borderWidth = 3.0f;
    }
    if(![_passwordTextField.text isEqual:@"password"]){
        _passwordTextField.layer.borderColor = [UIColor redColor].CGColor;
        _passwordTextField.layer.borderWidth = 3.0f;
    }
}
- (IBAction)RegisterButtonPressed:(UIButton *)sender {
}
@end
