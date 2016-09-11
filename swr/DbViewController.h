//
//  DbViewController.h
//  swr
//
//  Created by Yuriy Paterega on 13.08.15.
//  Copyright (c) 2015 Yuriy Paterega. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface DbViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *dbView;




@end