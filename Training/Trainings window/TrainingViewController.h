//
//  TrainingViewController.h
//  Training
//
//  Created by Юра Уласевич on 5/6/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>


@interface TrainingViewController : UIViewController{
    IBOutlet UILabel *trainingLabel;
    IBOutlet UILabel *trainerLoginLable;
    IBOutlet UILabel *specializationLable;
    IBOutlet UILabel *durationLabel;
    IBOutlet UILabel *descriptionLabel;
    
    FMResultSet* _results;
    FMDatabase* _database;
    NSString* _trainer;
    NSString* _spec;
    NSString* _duration;
    NSString* _description;
    NSString* _userLogin;
}

@property(nonatomic, assign) NSString* label;
- (IBAction)subscribeBtnClick:(UIButton *)sender;

@end


