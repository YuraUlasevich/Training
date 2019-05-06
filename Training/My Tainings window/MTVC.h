//
//  MTVC.h
//  Training
//
//  Created by Юра Уласевич on 5/7/19.
//  Copyright © 2019 Юра Уласевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>
#import "MyTrainingsViewController.h"

@interface MTVC : UITableViewController{
    FMResultSet* _results;
    FMDatabase* _database;
    
    NSMutableArray* _labelItems;
    NSString* _userLogin;
}

@end
