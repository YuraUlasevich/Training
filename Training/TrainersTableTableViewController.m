//
//  TrainersTableTableViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/24/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "TrainersTableTableViewController.h"
#import "UIScrollView+FloatingButton.h"
#import "MainWindowViewController.h"
#import <FMDB.h>

@interface TrainersTableTableViewController () <MEVFloatingButtonDelegate>{
    NSMutableArray *_loginItems;
}

@end

@implementation TrainersTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MEVFloatingButton *button = [[MEVFloatingButton alloc] init];
    button.animationType = MEFloatingButtonAnimationFadeIn;
    button.displayMode = MEVFloatingButtonDisplayModeAlways;
    button.position = MEVFloatingButtonPositionBottomRight;
    button.image = [UIImage imageNamed:@"Icon0"];
    button.imageColor = [UIColor colorWithRed:43/255.0f green:204/255.0f blue:113/255.0f alpha:1];
    button.backgroundColor = [UIColor colorWithRed:154/255.0f green:18/255.0f blue:197/255.0f alpha:1];
    button.outlineWidth = 0.0f;
    button.imagePadding = 15.0f;
    button.horizontalOffset = -30.0f;
    button.verticalOffset = -30.0f;
    button.rounded = YES;
    button.shadowColor = [UIColor lightGrayColor];
    button.shadowOffset = CGSizeMake(3, 3);
    button.shadowOpacity = 0.6f;
    button.shadowRadius = 3.0f;
    [self.tableView setFloatingButtonView:button];
    [self.tableView setFloatingButtonDelegate:self];
    _loginItems = [[NSMutableArray alloc] init];
    [self loadItems];
}

#pragma mark - Table view data source

- (void)textViewDidChange:(UITextView *)textView {
    CGPoint currentOffset = self.tableView.contentOffset;
    [UIView setAnimationsEnabled:NO];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [UIView setAnimationsEnabled:YES];
    [self.tableView setContentOffset:currentOffset animated:NO];
}

-(void) loadItems{
    //определяем путь к файлу с базой
    NSString* databasePath = @"/Users/uraulasevic/Development/kurs/my.db";
    //создаем подключение к базе
    FMDatabase *database;
    database = [FMDatabase databaseWithPath:databasePath];
    database.traceExecution = false; //выводит подробный лог запросов в консоль
    [database open];
    
    //выполняем выборку из таблицы client
    FMResultSet *results = [database executeQuery:@"select * from trainer"];
    while([results next]) {
        NSString *trainerLogin = [results stringForColumn:@"login"];
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        [_loginItems insertObject:trainerLogin atIndex:[_loginItems count]];
    }
    
    //удаляем подключение к базе
    [database close];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _loginItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text  = _loginItems[indexPath.row];
    return cell;
}


- (void)floatingButton:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    NSLog(@"didTapButton");
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    MainWindowViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}

- (void)floatingButtonWillAppear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonWillAppear");
}

- (void)floatingButtonDidAppear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonDidAppear");
}

- (void)floatingButtonWillDisappear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonWillDisappear");
}

- (void)floatingButtonDidDisappear:(UIScrollView *)scrollView; {
    NSLog(@"floatingButtonDidDisappear");
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
