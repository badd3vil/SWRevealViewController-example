//
//  DbViewController.m
//  swr
//
//  Created by Yuriy Paterega on 13.08.15.
//  Copyright (c) 2015 Yuriy Paterega. All rights reserved.
//

#import "DbViewController.h"
#import "SWRevealViewController.h"
#import "FrontViewController.h"

@interface DbViewController()
{
    NSInteger _presentedRow;
}
@property (nonatomic, strong, readonly) NSFetchedResultsController *fetchedResultsController;

@end

@implementation DbViewController

@synthesize dbView = _dbView;
@synthesize fetchedResultsController = _fetchedResultsController;



- (void)viewDidLoad
{
    self.title = NSLocalizedString(@"Database", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    //Add an image to your project & set that image here.
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    [super viewDidLoad];
    
}




#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
    
 /*   if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSString *text = nil;
    if (row == 0)
    {
        text = @"";
    }
    else if (row == 1)
    {
        text = @"";
    }
    
    
    cell.textLabel.text = NSLocalizedString( text, nil );
    */
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


@end


