//
//  TrainersViewController.m
//  Training
//
//  Created by Юра Уласевич on 5/7/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "TrainersViewController.h"

@interface TrainersViewController ()

@end

@implementation TrainersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadItems];
    fNLable.text = _firstName;
    sNLabel.text = _secondName;
    trainerLoginLable.text = _login;
    emailLabel.text = _email;
    specLabel.text = _spec;
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

-(void)didSwipe:(UISwipeGestureRecognizer*) swipe{
    if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainers" bundle:nil];
        TrainersViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainersTableTableViewController"];
        [self presentViewController:myVC animated:YES completion:nil];
    }
}

-(void)loadItems{
    NSString* databasePath = @"/Users/uraulasevic/Development/kurs/my.db";
    //создаем подключение к базе
    _database = [FMDatabase databaseWithPath:databasePath];
    _database.traceExecution = false; //выводит подробный лог запросов в консоль
    [_database open];
    
    NSString* testStr=[NSString stringWithFormat:@"select firstname, second_name, email, specialization from trainer where login = '%@'", _login];
    
    //выполняем выборку из таблицы client
    _results = [_database executeQuery:testStr];
    while([_results next]) {
        _firstName = [_results stringForColumn:@"firstname"];
        _spec = [_results stringForColumn:@"specialization"];
        _secondName = [_results stringForColumn:@"second_name"];
        _email = [_results stringForColumn:@"email"];
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

@end
