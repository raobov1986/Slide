// CenterViewController.m
// KitchenSink
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
//

#import "CenterViewController.h"
#import "TheSidebarController.h"
#import "CustomCell.h"


@interface CenterViewController()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIBarButtonItem *leftButton;
@property (strong, nonatomic) UIBarButtonItem *rightButton;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *sidebarStyles;
@property (assign, nonatomic) SidebarTransitionStyle sidebarTransitionStyle;
@property (assign, nonatomic) NSInteger selectedRowCell;

- (void)leftButtonClicked;
- (void)rightButtonClicked;

@end


@implementation CenterViewController

- (void)viewDidLoad
{
    self.title = @"The Sidebar Controller";
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClicked)];
    self.navigationItem.leftBarButtonItem = self.leftButton;
    
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClicked)];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 55;
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
 
    self.sidebarStyles = @[
       @{@"title":      @"SidebarTransitionStyleFacebook",
         @"subtitle":   @"Content slides to reveal sidebar"},
       
       @{@"title":      @"SidebarTransitionStyleAirbnb",
         @"subtitle":   @"Content rotates in 3D space to reveal sidebar"},
       
       @{@"title":      @"SidebarTransitionStyleLuvocracy",
         @"subtitle":   @"Content zooms out to reveal sidebar"},
  
       @{@"title":      @"SidebarTransitionStyleFeedly",
         @"subtitle":   @"Sidebar slides over content"},
       
       @{@"title":      @"SidebarTransitionStyleFlipboard",
         @"subtitle":   @"Sidebar slides over while content zooms out"},
       
       @{@"title":      @"SidebarTransitionStyleWunderlist",
         @"subtitle":   @"Content and sidebar slide making a parallax effect"}
    ];
    
    self.selectedRowCell = 0;
}

- (void)leftButtonClicked
{
    if(self.sidebarController.sidebarIsPresenting)
    {
        [self.sidebarController dismissSidebarViewController];
    }
    else
    {
        [self.sidebarController presentLeftSidebarViewControllerWithStyle:self.selectedRowCell];
    }
}

- (void)rightButtonClicked
{
    if(self.sidebarController.sidebarIsPresenting)
    {
        [self.sidebarController dismissSidebarViewController];
    }
    else
    {
        [self.sidebarController presentRightSidebarViewControllerWithStyle:self.selectedRowCell];
    }
}

#pragma mark - UITableView Delegate Methods
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sidebarStyles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.sidebarStyles[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.sidebarStyles[indexPath.row][@"subtitle"];
    
    if(self.selectedRowCell == indexPath.row)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRowCell = indexPath.row;
    [tableView reloadData];
}

@end
