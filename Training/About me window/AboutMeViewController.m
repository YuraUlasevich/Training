//
//  AbourMeViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "AboutMeViewController.h"


@interface AboutMeViewController ()

@end

@implementation AboutMeViewController
@synthesize transV, sidePanel, menuBtn, contentView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSidePanel:)];
    tapper.numberOfTapsRequired = 1;
    [transV addGestureRecognizer:tapper];
    [self loadItems];
}

- (void)loadItems
{
    _userDefault = [NSUserDefaults standardUserDefaults];
    NSString* result = [_userDefault objectForKey:@"login"];
    if ([result length]) {
        _userLogin = [_userDefault objectForKey:@"login"];
    } else {
        NSLog(@"Problems");
    }
    
    //определяем путь к файлу с базой
    NSString* databasePath = @"/Users/uraulasevic/Development/kurs/my.db";
    //создаем подключение к базе
    FMDatabase *database;
    database = [FMDatabase databaseWithPath:databasePath];
    database.traceExecution = false; //выводит подробный лог запросов в консоль
    [database open];
    
    NSString* testStr=[NSString stringWithFormat:@"select firstname, second_name, email, height, weight from client where login = '%@'", _userLogin];
    
    //выполняем выборку из таблицы client
    _results = [database executeQuery:testStr];
    while([_results next]) {
        _userFN = [_results stringForColumn:@"firstname"];
        _userSN = [_results stringForColumn:@"second_name"];
        _userEmail = [_results stringForColumn:@"email"];
        _userHeight = [_results stringForColumn:@"height"];
        _userWeight = [_results stringForColumn:@"weight"];
    }
    [database close];
    
    firstName.text = _userFN;
    secondName.text = _userSN;
    email.text = _userEmail;
    login.text = _userLogin;
    height.text = _userHeight;
    weight.text = _userWeight;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) hideSidePanel:(UIGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateEnded){
        [transV setHidden:YES];
        [UIView transitionWithView:sidePanel duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect frame = self->sidePanel.frame;
            frame.origin.x = -self->sidePanel.frame.size.width;
            self->sidePanel.frame = frame;
        } completion:nil];
    }
}

-(IBAction)buttonPressed:(id)sender{
    _count+=1;
    if(sender == menuBtn){
        if(_count%2==1){
            [transV setHidden:NO];
            [UIView transitionWithView:sidePanel duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self->sidePanel.frame;
                frame.origin.x = 0;
                self->sidePanel.frame = frame;
            } completion:nil];
        } else if(_count%2==0){
            [transV setHidden:YES];
            [UIView transitionWithView:sidePanel duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self->sidePanel.frame;
                frame.origin.x = -self->sidePanel.frame.size.width;
                self->sidePanel.frame = frame;
            } completion:nil];
        }
    }
}

- (IBAction)mainBtnPress:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)trainersBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainers" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainersTableTableViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)myTrainingsBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"MyTrainings" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MyTrainingsViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)calendarBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Calendar" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"CalendarViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)trainingsBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainings" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainingsViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)chaingeBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"AboutMe" bundle:nil];
    AboutMeViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"ChangeViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}



@end
