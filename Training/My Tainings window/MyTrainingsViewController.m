//
//  MyTrainingsViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "MyTrainingsViewController.h"

@interface MyTrainingsViewController ()

@end

@implementation MyTrainingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadItems];
    trainingLabel.text = _label;
    trainerLoginLable.text = _trainer;
    specializationLable.text = _spec;
    durationLabel.text = _duration;
    descriptionLabel.text = _description;
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

-(void)didSwipe:(UISwipeGestureRecognizer*) swipe{
    if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"MyTrainings" bundle:nil];
        MyTrainingsViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MTVC"];
        [self presentViewController:myVC animated:YES completion:nil];
    }
}


-(void)loadItems{
    NSString* databasePath = @"/Users/uraulasevic/my.db";
    //создаем подключение к базе
    _database = [FMDatabase databaseWithPath:databasePath];
    _database.traceExecution = false; //выводит подробный лог запросов в консоль
    [_database open];
    
    NSString* testStr=[NSString stringWithFormat:@"select trainer_login, duration, specialization, description from training where label = '%@'", _label];
    
    //выполняем выборку из таблицы client
    _results = [_database executeQuery:testStr];
    while([_results next]) {
        _trainer = [_results stringForColumn:@"trainer_login"];
        _spec = [_results stringForColumn:@"specialization"];
        _duration = [_results stringForColumn:@"duration"];
        _description = [_results stringForColumn:@"description"];
    }
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

- (IBAction)usBtnPressed:(UIButton *)sender {
    NSUserDefaults* _userDefault = [NSUserDefaults standardUserDefaults];
    NSString* result = [_userDefault objectForKey:@"login"];
    if ([result length]) {
        _userLogin = [_userDefault objectForKey:@"login"];
    } else {
        NSLog(@"Problems");
    }
    NSString* databasePath = @"/Users/uraulasevic/my.db";
    //создаем подключение к базе
    _database = [FMDatabase databaseWithPath:databasePath];
    _database.traceExecution = false; //выводит подробный лог запросов в консоль
    [_database open];
    NSString* testStr=[NSString stringWithFormat:@"delete from client_choise where  label = '%@' and client_login =  '%@'", _label, _userLogin];
    
    //выполняем выборку из таблицы client
    if (![_database executeUpdate:testStr]) {
        NSLog(@"db insert err");
        [_database close];
    }
    else{
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"MyTrainings" bundle:nil];
        MyTrainingsViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MTVC"];
        [self presentViewController:myVC animated:YES completion:nil];
    }
    [_database close];
}
@end
