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
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer * handledTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(handleEndEditing)];
    [self.view addGestureRecognizer:handledTap];
}

- (void) handleEndEditing{
    [self.view endEditing:YES];
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
    NSString* patterForHeight = @"[0-9]{3}";
    NSString* patterForWeight = @"[0-9]{2,3}";
    NSString* patterForLogin = @"[a-zA-z0-9]{6,20}";
    NSString* patterForPassword = @"[a-z0-9]{6,20}";
    NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
    NSError*  errorFirstName = NULL;
    NSError*  errorSecondName = NULL;
    NSError*  errorHeight = NULL;
    NSError*  errorWeight = NULL;
    NSError*  errorLogin = NULL;
    NSError*  errorPassword = NULL;
    //    NSError*  errorPassword = NULL;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patterForFirstName options:regexOptions error:&errorFirstName];
    NSUInteger numberOfMatchesFirstName = [regex numberOfMatchesInString:_firstNameRegisterTextField.text
                                                        options:0
                                                          range:NSMakeRange(0, [_firstNameRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patterForSecondName options:regexOptions error:&errorSecondName];
    NSUInteger numberOfMatchesSecondName = [regex numberOfMatchesInString:_secondNameRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_secondNameRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patterForHeight options:regexOptions error:&errorHeight];
    NSUInteger numberOfMatchesHeight = [regex numberOfMatchesInString:_heightRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_heightRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patterForWeight options:regexOptions error:&errorWeight];
    NSUInteger numberOfMatchesWeight = [regex numberOfMatchesInString:_weightRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_weightRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patterForLogin options:regexOptions error:&errorLogin];
    NSUInteger numberOfMatchesLogin = [regex numberOfMatchesInString:_loginRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_loginRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patterForPassword options:regexOptions error:&errorPassword];
    NSUInteger numberOfMatchesPassword = [regex numberOfMatchesInString:_passwordRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_passwordRegisterTextField.text length])];

    if(numberOfMatchesFirstName == 0){
        _firstNameRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _firstNameRegisterTextField.layer.borderWidth = 3.0f;
    }
    if(numberOfMatchesSecondName == 0){
        _secondNameRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _secondNameRegisterTextField.layer.borderWidth = 3.0f;
    }
    if(numberOfMatchesHeight == 0){
        _heightRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _heightRegisterTextField.layer.borderWidth = 3.0f;
    }
    if(numberOfMatchesWeight == 0){
        _weightRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _weightRegisterTextField.layer.borderWidth = 3.0f;
    }
    if(numberOfMatchesLogin == 0){
        _loginRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _loginRegisterTextField.layer.borderWidth = 3.0f;
    }
    if(numberOfMatchesPassword == 0){
        _passwordRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
        _passwordRegisterTextField.layer.borderWidth = 3.0f;
    }
    if(numberOfMatchesFirstName !=0 && numberOfMatchesSecondName !=0 && numberOfMatchesWeight !=0 && numberOfMatchesHeight !=0 && numberOfMatchesPassword != 0 && numberOfMatchesLogin !=0){
//
//        [User addUser:_firstNameRegisterTextField.text andSecondName:_secondNameRegisterTextField.text andLogin:_loginRegisterTextField.text];
        NSLog(@"All is good");
    }
        
    
}
@end
