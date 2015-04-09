// SidebarFacebookAnimation.m
// TheSidebarController
//
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
//


#import "SidebarFacebookAnimation.h"

@implementation SidebarFacebookAnimation

+ (void)animateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    [self resetSidebarPosition:sidebarView];
    [self resetContentPosition:contentView];
    
    
    CGRect contentFrame = contentView.frame;
    
    if(side == LeftSide)
    {
        contentFrame.origin.x += visibleWidth;
    }
    else
    {
        contentFrame.origin.x -= visibleWidth;
    }
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.frame = contentFrame;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
}


+ (void)reverseAnimateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    CGRect contentFrame = contentView.frame;
    contentFrame.origin.x = 0;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.frame = contentFrame;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
}

@end
