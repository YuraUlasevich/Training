//
//  AbourMeViewController.h
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>

@interface AboutMeViewController : UIViewController{
    IBOutlet UIView *transV;
    IBOutlet UIView *sidePanel;
    IBOutlet UIButton *menuBtn;
    IBOutlet UIView *contentView;
    IBOutlet UILabel *firstName;
    IBOutlet UILabel *secondName;
    IBOutlet UILabel *email;
    IBOutlet UILabel *login;
    IBOutlet UILabel *height;
    IBOutlet UILabel *weight;
    
    NSMutableArray* _firstNameItems;
    NSMutableArray* _secondNameItems;
    NSMutableArray* _emailItems;
    NSMutableArray* _loginItems;
    NSMutableArray* _heightItems;
    NSMutableArray* _weightItems;
    
    FMResultSet *_results;
    NSUserDefaults* _userDefault;
    
    NSString* _userFN;
    NSString* _userSN;
    NSString* _userEmail;
    NSString* _userLogin;
    NSString* _userPassword;
    NSString* _userHeight;
    NSString* _userWeight;
}

- (IBAction)mainBtnPress:(UIButton *)sender;
- (IBAction)trainersBtnPressed:(UIButton *)sender;
- (IBAction)myTrainingsBtnPressed:(UIButton *)sender;
- (IBAction)calendarBtnPressed:(UIButton *)sender;
- (IBAction)trainingsBtnPressed:(UIButton *)sender;
- (IBAction)chaingeBtnPressed:(UIButton *)sender;


@property(nonatomic) UIView *transV;
@property(nonatomic) UIView *sidePanel;
@property(nonatomic) UIButton *menuBtn;
@property(nonatomic) UIView *contentView;
@property int count;
@end


