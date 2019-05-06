//
//  TTVC.m
//  Training
//
//  Created by Юра Уласевич on 5/6/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "TTVC.h"

@interface TTVC ()

@end

@implementation TTVC{
    NSMutableArray *_labelItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _labelItems = [[NSMutableArray alloc] init];
    [self loadItems];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

-(void)didSwipe:(UISwipeGestureRecognizer*) swipe{
    if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
        TTVC* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
        [self presentViewController:myVC animated:YES completion:nil];
    }
}


#pragma mark - Table view data source

-(void) loadItems{
    //определяем путь к файлу с базой
    NSString* databasePath = @"/Users/uraulasevic/Development/kurs/my.db";
    //создаем подключение к базе
    FMDatabase *database;
    database = [FMDatabase databaseWithPath:databasePath];
    database.traceExecution = false; //выводит подробный лог запросов в консоль
    [database open];
    
    //выполняем выборку из таблицы client
    FMResultSet *results = [database executeQuery:@"select * from training"];
    while([results next]) {
        NSString *trainerLogin = [results stringForColumn:@"label"];
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        [_labelItems insertObject:trainerLogin atIndex:[_labelItems count]];
    }
    //удаляем подключение к базе
    [database close];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _labelItems.count;
}

- (void)textViewDidChange:(UITextView *)textView {
    CGPoint currentOffset = self.tableView.contentOffset;
    [UIView setAnimationsEnabled:NO];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [UIView setAnimationsEnabled:YES];
    [self.tableView setContentOffset:currentOffset animated:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text  = _labelItems[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Trainings" bundle:nil];
    TrainingViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"TrainingViewController"];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    myVC.label = cell.textLabel.text;
    [self presentViewController:myVC animated:YES completion:nil];
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
