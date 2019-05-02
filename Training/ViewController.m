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
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer * handledTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(handleEndEditing)];
    [self.view addGestureRecognizer:handledTap];
    _loginItems = [[NSMutableArray alloc] init];
    _fNItems = [[NSMutableArray alloc] init];
    _sNItems = [[NSMutableArray alloc] init];
    _emItems = [[NSMutableArray alloc] init];
    _heItems = [[NSMutableArray alloc] init];
    _weItems = [[NSMutableArray alloc] init];
    _passwordItems = [[NSMutableArray alloc] init];
    [self loadItems];
}
- (void)loadItems
{
    //определяем путь к файлу с базой
    NSString* databasePath = @"/Users/uraulasevic/Development/kurs/my.db";
    //создаем подключение к базе
    FMDatabase *database;
    database = [FMDatabase databaseWithPath:databasePath];
    database.traceExecution = false; //выводит подробный лог запросов в консоль
    [database open];
    
    //выполняем выборку из таблицы client
    _results = [database executeQuery:@"select * from client"];
    while([_results next]) {
        NSString *login = [_results stringForColumn:@"login"];
        NSString *password = [_results stringForColumn:@"password"];
        NSString *fN = [_results stringForColumn:@"firstname"];
        NSString *sN = [_results stringForColumn:@"second_name"];
        NSString *em = [_results stringForColumn:@"email"];
        NSString *he = [_results stringForColumn:@"height"];
        NSString *we = [_results stringForColumn:@"weight"];
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        [_loginItems insertObject:login atIndex:[_loginItems count]];
        [_passwordItems insertObject:password atIndex:[_passwordItems count]];
        [_fNItems insertObject:fN atIndex:[_fNItems count]];
        [_sNItems insertObject:sN atIndex:[_sNItems count]];
        [_emItems insertObject:em atIndex:[_emItems count]];
        [_heItems insertObject:he atIndex:[_heItems count]];
        [_weItems insertObject:we atIndex:[_weItems count]];
    }
    
    //удаляем подключение к базе
    [database close];
}


- (void) handleEndEditing{
    [self.view endEditing:YES];
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    BOOL flag = NO;
    for(int i=0; i<_loginItems.count; i++){
        if([_loginItems[i] isEqualToString:_loginTextField.text] && [_passwordItems[i] isEqualToString:_passwordTextField.text]){
            flag = YES;
            break;
        }
    }
    if(!flag){
        _loginTextField.layer.borderColor = [UIColor redColor].CGColor;
        _loginTextField.layer.borderWidth = 3.0f;
        _passwordTextField.layer.borderColor = [UIColor redColor].CGColor;
        _passwordTextField.layer.borderWidth = 3.0f;
    }
    if(flag){
        NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
        NSString* result = [userDefault objectForKey:@"login"];
        if ([result length]) {
            NSLog(@"login = %@", [userDefault objectForKey:@"login"]);
            NSLog(@"password = %@", [userDefault objectForKey:@"login"]);
        } else {
            NSLog(@"Add values to UserDefaults");
            [userDefault setObject:_loginTextField.text forKey:@"login"];
            [userDefault setObject:_passwordTextField.text forKey:@"password"];
            [userDefault synchronize];
        }
        NSLog(@"%@", [userDefault objectForKey:@"login"]);
        NSLog(@"%@", [userDefault objectForKey:@"password"]);
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
        MainWindowViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
        [self presentViewController:myVC animated:YES completion:nil];
        
    }
}

- (IBAction)RegisterButtonPressed:(UIButton *)sender {
}
@end
