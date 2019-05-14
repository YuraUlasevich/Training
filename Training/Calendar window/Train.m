//
//  Train.m
//  Training
//
//  Created by Юра Уласевич on 5/7/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "Train.h"


@interface Train ()

@end

@implementation Train

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadItems];
    
    
    trainerLoginLable.text = _trainerLogin;
    descriptionLabel.text = _description;
    trainingLabelLabel.text = _trainingLabel;
    
    // Do any additional setup after loading the view.
}

-(void)loadItems{
    NSUserDefaults* _userDefault = [NSUserDefaults standardUserDefaults];
    NSString* result = [_userDefault objectForKey:@"login"];
    if ([result length]) {
        _userLogin = [_userDefault objectForKey:@"login"];
    } else {
        NSLog(@"Problems");
    }
    NSString* databasePath = @"/Users/uraulasevic/Dropbox/my.db";
    //создаем подключение к базе
    _database = [FMDatabase databaseWithPath:databasePath];
    _database.traceExecution = false; //выводит подробный лог запросов в консоль
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringDate = [dateFormatter stringFromDate:_trainingDate];
    NSLog(@"%@", stringDate);
    
    [_database open];
    NSString* testStr=[NSString stringWithFormat:@"select * from train where client_login = '%@' and train_date = '%@'", _userLogin, stringDate];
    
    //выполняем выборку из таблицы client
    _results = [_database executeQuery:testStr];
    
    while([_results next]) {
        _trainerLogin = [_results stringForColumn:@"trainer_login"];
        _trainingLabel = [_results stringForColumn:@"label"];
        _description = [_results stringForColumn:@"description"];
    }
    NSLog(@"%@", _trainerLogin);
    [_database close];
   
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
