//
//  CalendarViewController.h
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSDFDatePickerView.h"


@interface CalendarViewController : UIViewController{
    IBOutlet UIView *transV;
    IBOutlet UIView *sidePanel;
    IBOutlet UIButton *menuBtn;
    IBOutlet UIView *mainView;
    IBOutlet UIView *contentView;
    
}
- (IBAction)mainBtnPressed:(UIButton *)sender;
- (IBAction)aboutMeBtnPressed:(UIButton *)sender;
- (IBAction)trainersBtnPressed:(UIButton *)sender;
- (IBAction)myTrainingsBtnPressed:(UIButton *)sender;
- (IBAction)trainingsBtnPressed:(UIButton *)sender;


@property(nonatomic) UIView *transV;
@property(nonatomic) UIView *sidePanel;
@property(nonatomic) UIButton *menuBtn;
@property(nonatomic) UIView *mainView;
@property(nonatomic) UIView *contentView;
@property int count;
@end


