//
//  ViewController.h
//  Training
//
//  Created by Юра Уласевич on 4/4/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterController.h"
#import <FMDB.h>


@interface ViewController : UIViewController{
    NSMutableArray *_loginItems;
    NSMutableArray *_fNItems;
    NSMutableArray *_sNItems;
    NSMutableArray *_emItems;
    NSMutableArray *_heItems;
    NSMutableArray *_passwordItems;
    NSMutableArray *_weItems;
    FMResultSet *_results;
}
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;

- (IBAction)RegisterButtonPressed:(UIButton *)sender;


@end

