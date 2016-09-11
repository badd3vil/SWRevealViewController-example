//
//  urltoList.h
//  swr
//
//  Created by Yuriy Paterega on 14.08.15.
//  Copyright (c) 2015 Yuriy Paterega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface urltoList : UIViewController <UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *heroTableView;

@end
