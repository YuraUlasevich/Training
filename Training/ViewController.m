//
//  ViewController.m
//  Training
//
//  Created by Юра Уласевич on 4/4/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer * handledTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(handleEndEditing)];
    [self.view addGestureRecognizer:handledTap];
}

- (void) handleEndEditing{
    [self.view endEditing:YES];
}


@end
