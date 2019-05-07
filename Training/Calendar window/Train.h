//
//  Train.h
//  Training
//
//  Created by Юра Уласевич on 5/7/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>
@interface Train : UIViewController{
    FMResultSet* _results;
    FMDatabase* _database;
    NSUserDefaults* _userDefault;
    NSString* _userLogin;
    
    
    IBOutlet UILabel *trainingLabelLabel;
    IBOutlet UILabel *trainerLoginLable;
    IBOutlet UILabel *descriptionLabel;
    
    NSString *_trainerLogin;
    NSString *_trainingLabel;
    NSString *_description;
}

@property(nonatomic, assign) NSDate* trainingDate;
@end


