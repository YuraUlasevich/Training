//
//  MainWindowViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/9/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "MainWindowViewController.h"

@interface MainWindowViewController ()

@end

@implementation MainWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)button:(id)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainWindowViewController* myVC = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:myVC animated:YES completion:nil];
}
@end
