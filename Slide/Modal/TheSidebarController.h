// TheSidebarController.h
// TheSidebarController
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SidebarAnimation.h"

@protocol TheSidebarControllerDelegate;

@interface TheSidebarController : UIViewController

@property (strong, nonatomic) UIViewController *contentViewController;
@property (strong, nonatomic) UIViewController *leftSidebarViewController;
@property (strong, nonatomic) UIViewController *rightSidebarViewController;

@property (assign, nonatomic) NSTimeInterval animationDuration;
@property (assign, nonatomic) CGFloat visibleWidth;
@property (assign, nonatomic) BOOL sidebarIsPresenting;
@property (assign, nonatomic) id<TheSidebarControllerDelegate> delegate;
@property (assign, nonatomic) BOOL storyboardsUseAutolayout;

- (id)initWithContentViewController:(UIViewController *)contentViewController
          leftSidebarViewController:(UIViewController *)leftSidebarViewController;

- (id)initWithContentViewController:(UIViewController *)contentViewController
         rightSidebarViewController:(UIViewController *)rightSidebarViewController;

- (id)initWithContentViewController:(UIViewController *)contentViewController
          leftSidebarViewController:(UIViewController *)leftSidebarViewController
         rightSidebarViewController:(UIViewController *)rightSidebarViewController;

- (id)initWithContentViewController:(UIViewController *)contentViewController
          leftSidebarViewController:(UIViewController *)leftSidebarViewController
           storyboardsUseAutoLayout:(BOOL)storyboardsUseAutoLayout;

- (id)initWithContentViewController:(UIViewController *)contentViewController
         rightSidebarViewController:(UIViewController *)rightSidebarViewController
           storyboardsUseAutoLayout:(BOOL)storyboardsUseAutoLayout;

- (id)initWithContentViewController:(UIViewController *)contentViewController
          leftSidebarViewController:(UIViewController *)leftSidebarViewController
         rightSidebarViewController:(UIViewController *)rightSidebarViewController
           storyboardsUseAutoLayout:(BOOL)storyboardsUseAutoLayout;

- (void)dismissSidebarViewController;
- (void)presentLeftSidebarViewController;
- (void)presentLeftSidebarViewControllerWithStyle:(SidebarTransitionStyle)transitionStyle;
- (void)presentRightSidebarViewController;
- (void)presentRightSidebarViewControllerWithStyle:(SidebarTransitionStyle)transitionStyle;

@end



@protocol TheSidebarControllerDelegate <NSObject>

@optional
- (void)sidebarController:(TheSidebarController *)sidebarController willShowViewController:(UIViewController *)viewController;
- (void)sidebarController:(TheSidebarController *)sidebarController didShowViewController:(UIViewController *)viewController;
- (void)sidebarController:(TheSidebarController *)sidebarController willHideViewController:(UIViewController *)viewController;
- (void)sidebarController:(TheSidebarController *)sidebarController didHideViewController:(UIViewController *)viewController;
@end



@interface UIViewController(TheSidebarController)

@property (strong, readonly, nonatomic) TheSidebarController *sidebarController;

@end
