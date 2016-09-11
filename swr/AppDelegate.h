//
//  AppDelegate.h
//  swr
//
//  Created by Yuriy Paterega on 13.08.15.
//  Copyright (c) 2015 Yuriy Paterega. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class SWRevealViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
@property (strong, nonatomic) SWRevealViewController *viewController;
//
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

