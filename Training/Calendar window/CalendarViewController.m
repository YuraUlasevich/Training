//
//  CalendarViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "CalendarViewController.h"
#import "MainWindowViewController.h"

#import <FMDB.h>

@interface CalendarViewController () <RSDFDatePickerViewDelegate>
@property (copy, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation CalendarViewController
@synthesize transV, menuBtn, sidePanel, contentView, mainView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _count = 0;
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSidePanel:)];
    tapper.numberOfTapsRequired = 1;
    _dateItems = [[NSMutableArray alloc] init];
    [transV addGestureRecognizer:tapper];
    
    [self loadItems];
    
    
    RSDFDatePickerView *datePickerView = [[RSDFDatePickerView alloc] initWithFrame:self.view.bounds];
    datePickerView.delegate = self;
    datePickerView.dataSource = self;
    [self.contentView addSubview:datePickerView];
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
    [_database open];
    NSString* testStr=[NSString stringWithFormat:@"select train_date from train where client_login = '%@'", _userLogin];
    
    //выполняем выборку из таблицы client
    _results = [_database executeQuery:testStr];
    while([_results next]) {
        NSString* trainDate = [_results stringForColumn:@"train_date"];
        NSLog(@"%@", trainDate);
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *dateFromString = [dateFormatter dateFromString:trainDate];
        [_dateItems insertObject:dateFromString atIndex:[_dateItems count]];
        NSLog(@"%@", dateFromString);
        
    }
    [_database close];
    NSLog(@"%@", _dateItems[0]);
    NSLog(@"%lu", (unsigned long)[_dateItems count]);
}
// Returns YES if the date should be highlighted or NO if it should not.
- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldHighlightDate:(NSDate *)date
{
    return YES;
}

// Returns YES if the date should be selected or NO if it should not.
- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldSelectDate:(NSDate *)date
{
    return YES;
}

// Prints out the selected date.
- (void)datePickerView:(RSDFDatePickerView *)view didSelectDate:(NSDate *)date
{
    if(![_dateItems containsObject:date]){
        [[[UIAlertView alloc] initWithTitle:@"No training" message:[self.dateFormatter stringFromDate:date] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else{
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Calendar" bundle:nil];
        Train* myVC = [sb instantiateViewControllerWithIdentifier:@"Train"];
        
        myVC.trainingDate = date;
        [self presentViewController:myVC animated:YES completion:nil];
    }
}


// Returns YES if the date should be marked or NO if it should not.
- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldMarkDate:(NSDate *)date
{
    // The date is an `NSDate` object without time components.
    // So, we need to use dates without time components.
    
    return [_dateItems containsObject:date];
}

// Returns the color of the default mark image for the specified date.
- (UIColor *)datePickerView:(RSDFDatePickerView *)view markImageColorForDate:(NSDate *)date
{
    return [UIColor colorWithRed:126/255.0f green:104/255.0f blue:250/255.0f alpha:1.0f];
}

// Returns the mark image for the specified date.
- (UIImage *)datePickerView:(RSDFDatePickerView *)view markImageForDate:(NSDate *)date
{
    if (arc4random() % 2 == 0) {
        return [UIImage imageNamed:@"img_gray_mark"];
    } else {
        return [UIImage imageNamed:@"img_green_mark"];
    }
}



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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)mainBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    CalendarViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)aboutMeBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"AboutMe" bundle:nil];
    CalendarViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"AboutMeViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)trainersBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainers" bundle:nil];
    CalendarViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainersTableTableViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)myTrainingsBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"MyTrainings" bundle:nil];
    CalendarViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MTVC"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (IBAction)trainingsBtnPressed:(UIButton *)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainings" bundle:nil];
    CalendarViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TTVC"];
    [self presentViewController:myVC animated:YES completion:nil];
}


@end
