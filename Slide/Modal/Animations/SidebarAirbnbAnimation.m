// SidebarAirbnbAnimation.m
// TheSidebarController
//
//
//  Created by admin on 4/9/15.
//  Copyright (c) 2015 MarcoMustapic. All rights reserved.
//

#import "SidebarAirbnbAnimation.h"

@implementation SidebarAirbnbAnimation

+ (void)animateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    [self resetSidebarPosition:sidebarView];
    [self resetContentPosition:contentView];
    
    
    // Animation settings for content view
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform.m34 = -1.0f / 800.0f;
    contentView.layer.zPosition = 100;
    
    // Animation settings for menu view
    CATransform3D sidebarTransform = CATransform3DIdentity;
    sidebarTransform = CATransform3DScale(sidebarTransform, 1.7, 1.7, 1.7);
    sidebarView.layer.transform = sidebarTransform;
    
    sidebarTransform = CATransform3DIdentity;
    sidebarTransform = CATransform3DScale(sidebarTransform, 1.0, 1.0, 1.0);
    
    if(side == LeftSide)
    {
        contentTransform = CATransform3DTranslate(contentTransform, visibleWidth - (contentView.frame.size.width / 2 * 0.4), 0.0, 0.0);
        contentTransform = CATransform3DScale(contentTransform, 0.6, 0.6, 0.6);
        contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(-45), 0.0, 1.0, 0.0);
    }
    else
    {
        contentTransform = CATransform3DTranslate(contentTransform, 0 - visibleWidth + (contentView.frame.size.width / 2 * 0.4), 0.0, 0.0);
        contentTransform = CATransform3DScale(contentTransform, 0.6, 0.6, 0.6);
        contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(45), 0.0, 1.0, 0.0);
    }
    
    
    // Animate content view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    // Animate menu view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.layer.transform = sidebarTransform;
                     }
                     completion:nil];
}


+ (void)reverseAnimateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    // Animation settings for content view
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform.m34 = -1.0f / 800.0f;
    contentView.layer.zPosition = 100;
    contentTransform = CATransform3DTranslate(contentTransform, 0.0, 0.0, 0.0);
    contentTransform = CATransform3DScale(contentTransform, 1.0, 1.0, 1.0);
    contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(0), 0.0, 1.0, 0.0);
    
    // Animation settings for menu view
    __block CATransform3D sidebarTransform = CATransform3DIdentity;
    sidebarTransform = CATransform3DScale(sidebarTransform, 1.7, 1.7, 1.7);
    
    
    // Animate content view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    // Animate menu view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.layer.transform = sidebarTransform;
                     }
                     completion:^(BOOL finished) {
                         sidebarTransform = CATransform3DIdentity;
                         sidebarTransform = CATransform3DScale(sidebarTransform, 1.0, 1.0, 1.0);
                         sidebarView.layer.transform = sidebarTransform;
                     }];
}

@end
