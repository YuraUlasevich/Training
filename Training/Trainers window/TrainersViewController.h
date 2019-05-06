//
//  TrainersViewController.h
//  Training
//
//  Created by Юра Уласевич on 5/7/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>


@interface TrainersViewController : UIViewController{
    IBOutlet UILabel *trainerLoginLable;
    IBOutlet UILabel *fNLable;
    IBOutlet UILabel *sNLabel;
    IBOutlet UILabel *emailLabel;
    IBOutlet UILabel *specLabel;
    
    FMResultSet* _results;
    FMDatabase* _database;
    NSString* _firstName;
    NSString* _spec;
    NSString* _secondName;
    NSString* _email;
}
@property(nonatomic, assign) NSString* login;
@end


