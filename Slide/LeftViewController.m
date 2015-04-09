// LeftViewController.m
// KitchenSink
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
//


#import "LeftViewController.h"
#import "TheSidebarController.h"


@interface LeftViewController()

- (void)dismissThisViewController;

@end



@implementation LeftViewController

- (void)viewDidLoad
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissThisViewController)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)dismissThisViewController
{
    [self.sidebarController dismissSidebarViewController];
}

@end
