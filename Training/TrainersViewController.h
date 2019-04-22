//
//  TrainersViewController.h
//  Training
//
//  Created by Юра Уласевич on 4/21/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TrainersViewController : UIViewController{
    IBOutlet UIView *transV;
    IBOutlet UIView *sidePanel;
    IBOutlet UIButton *menuBtn;
}
- (IBAction)mainBtnPressed:(UIButton *)sender;
- (IBAction)aboutMeBtnPressed:(UIButton *)sender;
- (IBAction)myTrainingsBtnPressed:(UIButton *)sender;
- (IBAction)trainingsBtnPressed:(UIButton *)sender;
- (IBAction)calendarBtnPressed:(UIButton *)sender;




@property(nonatomic) UIView *transV;
@property(nonatomic) UIView *sidePanel;
@property(nonatomic) UIButton *menuBtn;
@property int count;
@end


