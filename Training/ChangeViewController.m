//
//  ChangeViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/28/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userDefault = [NSUserDefaults standardUserDefaults];
    NSString* result = [_userDefault objectForKey:@"login"];
    if ([result length]) {
        _userLogin = [_userDefault objectForKey:@"login"];
    } else {
        NSLog(@"Problems");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)checkFN{
    NSString* patternForFirstName = @"[a-zа-я]{2,20}";
    if([_changeFN.text isEqual:@"First name"]){
        return NO;
    }
    else{
        NSError*  errorFirstName = NULL;
        NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForFirstName options:regexOptions error:&errorFirstName];
        NSUInteger numberOfMatchesFirstName = [regex numberOfMatchesInString:_changeFN.text
                                                                     options:0
                                                                       range:NSMakeRange(0, [_changeFN.text length])];
        if(numberOfMatchesFirstName == 0){
            _changeFN.layer.borderColor = [UIColor redColor].CGColor;
            _changeFN.layer.borderWidth = 3.0f;
            return NO;
        } else{
            return YES;
        }
    }
    return NO;
}

-(BOOL)checkSN{
    NSString* patternForSecondName = @"[a-zа-я]{2,20}";
    if([_changeFN.text isEqual:@"Second name"]){
        return NO;
    }
    else{
        NSError*  errorSecondName = NULL;
        NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForSecondName options:regexOptions error:&errorSecondName];
        NSUInteger numberOfMatchesSecondName = [regex numberOfMatchesInString:_changeSN.text
                                                                     options:0
                                                                       range:NSMakeRange(0, [_changeSN.text length])];
        if(numberOfMatchesSecondName == 0){
            _changeSN.layer.borderColor = [UIColor redColor].CGColor;
            _changeSN.layer.borderWidth = 3.0f;
            return NO;
        } else{
            return YES;
        }
    }
    return NO;
}

-(BOOL)checkEM{
    //NSString* patternForFirstName = @"[a-zа-я]{2,20}";
    if([_changeEM.text isEqual:@"Email"]){
        return NO;
    }
    else{
//        NSError*  errorFirstName = NULL;
//        NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
//        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForFirstName options:regexOptions error:&errorFirstName];
//        NSUInteger numberOfMatchesFirstName = [regex numberOfMatchesInString:_changeFN.text
//                                                                     options:0
//                                                                       range:NSMakeRange(0, [_changeFN.text length])];
//        if(numberOfMatchesFirstName == 0){
//            _changeFN.layer.borderColor = [UIColor redColor].CGColor;
//            _changeFN.layer.borderWidth = 3.0f;
//            return NO;
//        } else{
//            return YES;
//        }
        return YES;
    }
    return NO;
}


-(BOOL)checkH{
    NSString* patternForHeight = @"[0-9]{3}";
    if([_changeH.text isEqual:@"Height"]){
        return NO;
    }
    else{
        NSError*  errorH = NULL;
        NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForHeight options:regexOptions error:&errorH];
        NSUInteger numberOfMatchesH = [regex numberOfMatchesInString:_changeH.text
                                                                     options:0
                                                                       range:NSMakeRange(0, [_changeH.text length])];
        if(numberOfMatchesH == 0){
            _changeH.layer.borderColor = [UIColor redColor].CGColor;
            _changeH.layer.borderWidth = 3.0f;
            return NO;
        } else{
            return YES;
        }
    }
    return NO;
}

-(BOOL)checkW{
    NSString* patternForWeight = @"[0-9]{2,3}";
    if([_changeW.text isEqual:@"Weight"]){
        return NO;
    }
    else{
        NSError*  errorW = NULL;
        NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForWeight options:regexOptions error:&errorW];
        NSUInteger numberOfMatchesW = [regex numberOfMatchesInString:_changeW.text
                                                             options:0
                                                               range:NSMakeRange(0, [_changeW.text length])];
        if(numberOfMatchesW == 0){
            _changeW.layer.borderColor = [UIColor redColor].CGColor;
            _changeW.layer.borderWidth = 3.0f;
            return NO;
        } else{
            return YES;
        }
    }
    return NO;
}


-(BOOL)checkPSWD{
    NSString* patternForPassword = @"[a-z0-9]{6,20}";
    if([_changePSWD.text isEqual:@"Password"] && [_changePSWDConf.text isEqual:@"Confirm password"]){
        return NO;
    } else if(![_changePSWD.text isEqual:_changePSWDConf.text]){
        _changePSWD.layer.borderColor = [UIColor redColor].CGColor;
        _changePSWD.layer.borderWidth = 3.0f;
        _changePSWDConf.layer.borderColor = [UIColor redColor].CGColor;
        _changePSWDConf.layer.borderWidth = 3.0f;
        return NO;
    }
    else{
        NSError*  errorP = NULL;
        NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForPassword options:regexOptions error:&errorP];
        NSUInteger numberOfMatchesH = [regex numberOfMatchesInString:_changePSWD.text
                                                             options:0
                                                               range:NSMakeRange(0, [_changePSWD.text length])];
        if(numberOfMatchesH == 0){
            _changePSWD.layer.borderColor = [UIColor redColor].CGColor;
            _changePSWD.layer.borderWidth = 3.0f;
            return NO;
        } else{
            return YES;
        }
    }
    return NO;
}




- (IBAction)changeBtnPressed:(UIButton *)sender {
    NSString* databasePath = @"/Users/uraulasevic/Development/kurs/my.db";
    //создаем подключение к базе
    FMDatabase *database = [FMDatabase databaseWithPath:databasePath];
    database.traceExecution = false; //выводит подробный лог запросов в консоль
    
    
    NSString* testStr;
    NSLog(@"Chainge View Controller");
    if([self checkFN]){
        
        testStr=[NSString stringWithFormat:@"update client set '%@' = '%@' where login = '%@'", @"firstname", _changeFN.text ,_userLogin];
        [database open];
        BOOL flag = [database executeQuery:testStr];
        
        if(!flag){
            NSLog(@"Problems with update");
        }
        if(flag){
            NSLog(@"Update well");
        }
        [database close];
    }
    if([self checkSN]){
        testStr=[NSString stringWithFormat:@"update client set '%@' = '%@' where login = '%@'", @"second_name", _changeSN.text ,_userLogin];
        [database open];
        BOOL flag = [database executeQuery:testStr];
        [database close];
        if(!flag){
            NSLog(@"Problems with update");
        }
        if(flag){
            NSLog(@"Update well");
        }
    }
    if([self checkEM]){
        testStr=[NSString stringWithFormat:@"update client set '%@' = '%@' where login = '%@'", @"email", _changeEM.text ,_userLogin];
        [database open];
        BOOL flag = [database executeQuery:testStr];
        [database close];
        if(!flag){
            NSLog(@"Problems with update");
        }
        if(flag){
            NSLog(@"Update well");
        }
    }
    if([self checkH]){
        testStr=[NSString stringWithFormat:@"update client set '%@' = '%@' where login = '%@'", @"height", _changeH.text ,_userLogin];
        [database open];
        BOOL flag = [database executeQuery:testStr];
        [database close];
        if(!flag){
            NSLog(@"Problems with update");
        }
        if(flag){
            NSLog(@"Update well");
        }
    }
    if([self checkW]){
        testStr=[NSString stringWithFormat:@"update client set '%@' = '%@' where login = '%@'", @"weight", _changeW.text ,_userLogin];
        [database open];
        BOOL flag = [database executeQuery:testStr];
        [database close];
        if(!flag){
            NSLog(@"Problems with update");
        }
        if(flag){
            NSLog(@"Update well");
        }
    }
    if([self checkPSWD]){
        testStr=[NSString stringWithFormat:@"update client set '%@' = '%@' where login = '%@'", @"password", _changePSWD.text ,_userLogin];
        [database open];
        BOOL flag = [database executeQuery:testStr];
        [database close];
        if(!flag){
            NSLog(@"Problems with update");
        }
        if(flag){
            NSLog(@"Update well");
        }
    }
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"AboutMe" bundle:nil];
    ChangeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"AboutMeViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}
@end
