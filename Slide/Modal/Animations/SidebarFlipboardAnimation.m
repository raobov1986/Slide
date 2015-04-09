// SidebarFlipboardAnimation.m
// TheSidebarController
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
//


#import "SidebarFlipboardAnimation.h"

@implementation SidebarFlipboardAnimation

+ (void)animateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    [self resetSidebarPosition:sidebarView];
    [self resetContentPosition:contentView];
    
    
    CGRect sidebarFrame = sidebarView.frame;
    [sidebarView.superview bringSubviewToFront:sidebarView];
    
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform = CATransform3DScale(contentTransform, 0.9, 0.9, 0.9);
    
    if(side == LeftSide)
    {
        sidebarFrame.origin.x = -sidebarFrame.size.width;
        sidebarView.frame = sidebarFrame;
        sidebarFrame.origin.x += visibleWidth;
    }
    else
    {
        sidebarFrame.origin.x = sidebarFrame.size.width;
        sidebarView.frame = sidebarFrame;
        sidebarFrame.origin.x -= visibleWidth;
    }
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.frame = sidebarFrame;
                         contentView.alpha = 0.3;
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    
    
}

+ (void)reverseAnimateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    CGRect sidebarFrame = sidebarView.frame;
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform = CATransform3DScale(contentTransform, 1.0, 1.0, 1.0);
    
    if(side == LeftSide)
    {
        sidebarFrame.origin.x -= visibleWidth;
    }
    else
    {
        sidebarFrame.origin.x += visibleWidth;
    }
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.frame = sidebarFrame;
                         contentView.alpha = 1;
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
}


@end
