//
//  ChangeViewController.h
//  Training
//
//  Created by Юра Уласевич on 4/28/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>


@interface ChangeViewController : UIViewController{
    NSUserDefaults* _userDefault;
    NSString* _userLogin;
}
@property (strong, nonatomic) IBOutlet UITextField *changeFN;
@property (strong, nonatomic) IBOutlet UITextField *changeSN;
@property (strong, nonatomic) IBOutlet UITextField *changeEM;
@property (strong, nonatomic) IBOutlet UITextField *changeH;
@property (strong, nonatomic) IBOutlet UITextField *changeW;
@property (strong, nonatomic) IBOutlet UITextField *changePSWD;
@property (strong, nonatomic) IBOutlet UITextField *changePSWDConf;

- (IBAction)changeBtnPressed:(UIButton *)sender;



@end

