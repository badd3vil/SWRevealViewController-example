//
//  urltoList.h
//  swr
//
//  Created by Yuriy Paterega on 14.08.15.
//  Copyright (c) 2015 Yuriy Paterega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#define kSelectedTabDefaultsKey @"Selected Tab"
enum {
    kByName,
    kBySecretIdentity,
};

@interface urltoList : UIViewController <UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *heroTableView;
@property (weak, nonatomic) IBOutlet UITabBar *heroTabBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
- (IBAction)addHero:(id)sender;
@end
