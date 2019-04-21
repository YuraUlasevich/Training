//
//  MainWindowViewController.h
//  Training
//
//  Created by Юра Уласевич on 4/9/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"



@interface MainWindowViewController : UIViewController{
    IBOutlet UIView *transV;
    IBOutlet UIView *sidePanel;
    IBOutlet UIButton *menuBtn;
}
- (IBAction)calendarButtonPressed:(UIButton *)sender;
- (IBAction)myTrainingsButtonPressed:(UIButton *)sender;
- (IBAction)aboutMeButtonPressed:(UIButton *)sender;
- (IBAction)aboutMeBtnPressed:(UIButton *)sender;
- (IBAction)trainersBtnPressed:(UIButton *)sender;
- (IBAction)myTrainingsBtnPressed:(UIButton *)sender;
- (IBAction)calendarBtnPressed:(UIButton *)sender;

- (IBAction)trainsersButtonPressed:(UIButton *)sender;
@property(nonatomic) UIView *transV;
@property(nonatomic) UIView *sidePanel;
@property(nonatomic) UIButton *menuBtn;
@property int count;
@end


