//
//  MTVC.m
//  Training
//
//  Created by Юра Уласевич on 5/7/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "MTVC.h"

@interface MTVC ()

@end

@implementation MTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _labelItems = [[NSMutableArray alloc] init];
    [self loadItems];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

-(void)didSwipe:(UISwipeGestureRecognizer*) swipe{
    if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
        MTVC* myVC = [sb instantiateViewControllerWithIdentifier:@"MainWindowViewController"];
        [self presentViewController:myVC animated:YES completion:nil];
    }
}

-(void) loadItems{
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
    NSString* testStr=[NSString stringWithFormat:@"select label from client_choise where client_login = '%@'", _userLogin];
    
    //выполняем выборку из таблицы client
    _results = [_database executeQuery:testStr];
    while([_results next]) {
        NSString *trainerLogin = [_results stringForColumn:@"label"];
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        [_labelItems insertObject:trainerLogin atIndex:[_labelItems count]];
    }
    [_database close];
}
#pragma mark - Table view data source

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
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"MyTrainings" bundle:nil];
    MyTrainingsViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"MyTrainingsViewController"];
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
