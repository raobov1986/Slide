# Slide
This is slidemenu sample for ios 8.2.

# Screenshot
![alt tag](https://cloud.githubusercontent.com/assets/10333421/7195432/1d89dcf2-e4c8-11e4-9439-e5c4b694c06f.png)
![alt tag](https://cloud.githubusercontent.com/assets/10333421/7195436/2b492636-e4c8-11e4-9dea-c7bef01724c1.png)


# Usage

    CenterViewController *centerViewController = [[CenterViewController alloc] init];
    UINavigationController *contentViewController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    contentViewController.view.backgroundColor = [UIColor whiteColor];
    contentViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    contentViewController.view.layer.shadowOffset = (CGSize){0.0, 0.0};
    contentViewController.view.layer.shadowOpacity = 0.6;
    contentViewController.view.layer.shadowRadius = 20.0;
    
    LeftViewController *leftViewController = [[LeftViewController alloc] init];
    leftViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"left-sidebar"]];
    
    RightViewController *rightViewController = [[RightViewController alloc] init];
    rightViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"right-sidebar"]];
    
    TheSidebarController *sidebarController = [[TheSidebarController alloc] initWithContentViewController:contentViewController leftSidebarViewController:leftViewController rightSidebarViewController:rightViewController];
    sidebarController.delegate = self;
    sidebarController.view.backgroundColor = [UIColor blackColor];// colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
# Licence

//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
