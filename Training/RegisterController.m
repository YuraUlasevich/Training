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
    //[self loadItems];
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
    NSString* patternForFirstName = @"[a-zа-я]{2,20}";
    NSString* patternForSecondName = @"[a-z-]{2,20}";
    NSString* patternForHeight = @"[0-9]{3}";
    NSString* patternForWeight = @"[0-9]{2,3}";
    NSString* patternForLogin = @"[a-zA-z0-9]{6,20}";
    NSString* patternForPassword = @"[a-z0-9]{6,20}";
    NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
    NSError*  errorFirstName = NULL;
    NSError*  errorSecondName = NULL;
    NSError*  errorHeight = NULL;
    NSError*  errorWeight = NULL;
    NSError*  errorLogin = NULL;
    NSError*  errorPassword = NULL;
    //    NSError*  errorPassword = NULL;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:patternForFirstName options:regexOptions error:&errorFirstName];
    NSUInteger numberOfMatchesFirstName = [regex numberOfMatchesInString:_firstNameRegisterTextField.text
                                                        options:0
                                                          range:NSMakeRange(0, [_firstNameRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patternForSecondName options:regexOptions error:&errorSecondName];
    NSUInteger numberOfMatchesSecondName = [regex numberOfMatchesInString:_secondNameRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_secondNameRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patternForHeight options:regexOptions error:&errorHeight];
    NSUInteger numberOfMatchesHeight = [regex numberOfMatchesInString:_heightRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_heightRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patternForWeight options:regexOptions error:&errorWeight];
    NSUInteger numberOfMatchesWeight = [regex numberOfMatchesInString:_weightRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_weightRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patternForLogin options:regexOptions error:&errorLogin];
    NSUInteger numberOfMatchesLogin = [regex numberOfMatchesInString:_loginRegisterTextField.text
                                                                 options:0
                                                                   range:NSMakeRange(0, [_loginRegisterTextField.text length])];
    regex = [NSRegularExpression regularExpressionWithPattern:patternForPassword options:regexOptions error:&errorPassword];
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
        
        //определяем путь к файлу с базой
        NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"my.db"];
        //создаем подключение к базе
        FMDatabase *database;
        database = [FMDatabase databaseWithPath:path];
        database.traceExecution = false; //выводит подробный лог запросов в консоль
        [database open];
        
        //выполняем выборку из таблицы client
        
        NSString* testStr=[NSString stringWithFormat:@"INSERT INTO client (id_client, firstname, second_name, email, login, password, height, weight) VALUES (%i, '%@', '%@', '%@', '%@', '%@', %li,%li)", 5, _firstNameRegisterTextField.text, _secondNameRegisterTextField.text, _emailRegisterTextField.text, _loginRegisterTextField.text, _passwordRegisterTextField.text, [_heightRegisterTextField.text integerValue], [_weightRegisterTextField.text integerValue]];
        
        if (![database executeUpdate:testStr]) {
            NSLog(@"db insert err");
        }
        
        _results = [database executeQuery:@"select * from client"];
        while([_results next]) {
            NSString *login = [_results stringForColumn:@"login"];
            NSString *email = [_results stringForColumn:@"email"];
            //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
            [_loginItems insertObject:login atIndex:[_loginItems count]];
            [_emailItems insertObject:email atIndex:[_emailItems count]];
            NSLog(@"%@", login);
            NSLog(@"%@", email);
        }
        
        //удаляем подключение к базе
        [database close];
        
        
        
        
        
        
        
        
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
        MainWindowViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
        [self presentViewController:myVC animated:YES completion:nil];
//        BOOL flagForLogin = NO;
//        BOOL flagForEmail = NO;
//        for (int i=0; i<_loginItems.count-1; i++) {
//            if([_loginItems[i] isEqualToString:_loginRegisterTextField.text]){
//                flagForLogin = YES;
//                break;
//            }
//            if([_emailItems[i] isEqualToString:_emailRegisterTextField.text]){
//                flagForEmail = YES;
//                break;
//            }
//        }
//        if (!flagForLogin && !flagForEmail) {
//            UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
//            MainWindowViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
//            [self presentViewController:myVC animated:YES completion:nil];
//        }
//        else if(flagForLogin){
//            _loginRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
//            _loginRegisterTextField.layer.borderWidth = 3.0f;
//        }
//        else if (flagForEmail){
//            _emailRegisterTextField.layer.borderColor = [UIColor redColor].CGColor;
//            _emailRegisterTextField.layer.borderWidth = 3.0f;
//        }
    }
    
    
}

- (void)loadItems
{
    //определяем путь к файлу с базой
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"my.db"];
    //создаем подключение к базе
    FMDatabase *database;
    database = [FMDatabase databaseWithPath:path];
    database.traceExecution = false; //выводит подробный лог запросов в консоль
    [database open];
    
    //выполняем выборку из таблицы client
    _results = [database executeQuery:@"select * from client"];
    while([_results next]) {
        NSString *login = [_results stringForColumn:@"login"];
        NSString *email = [_results stringForColumn:@"email"];
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        [_loginItems insertObject:login atIndex:[_loginItems count]];
        [_emailItems insertObject:email atIndex:[_emailItems count]];
    }
    
    //удаляем подключение к базе
    [database close];
}

@end
