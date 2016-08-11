//
//  ChildTwoViewController.m
//  CubeViewController
//
//  Created by Robert Ryan on 7/20/13.
//  Copyright (c) 2013 GoKart Labs. All rights reserved.
//

#import "ChildTwoViewController.h"

@interface ChildTwoViewController ()

@end

@implementation ChildTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", (long)indexPath.row];
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"即将出现视图DemonstrationViewController");
    
    
}
@end
