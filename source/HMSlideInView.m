//
//  Created by HelloMihai on 8/7/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import "HMSlideInView.h"

@implementation HMSlideInView

+ (void)showAtBottomView:(UIView*)view viewHeight:(float)viewHeight withAnimationDuration:(float)animationDuration onViewController:(UIViewController*)onViewController
{
    [view setTranslatesAutoresizingMaskIntoConstraints:YES];
    CGRect onScreenFrame = [self frameOnScreenBottomFromView:view viewHeigth:viewHeight];
    
    if (animationDuration <= 0) { // instant
        view.frame = onScreenFrame;
        [[self window] addSubview:view];
        [[self window] makeKeyAndVisible];
        [[self window] bringSubviewToFront:view];
    } else { // animated
        view.frame = [self frameOffScreenBottomFromView:view viewHeigth:viewHeight];
        [[self window] addSubview:view];
        [UIView animateWithDuration:animationDuration
                         animations:^{
                             view.frame = onScreenFrame;
                         }];
    }
}

+ (void)hideAtBottomView:(UIView*)view viewHeight:(float)viewHeight withAnimationDuration:(float)animationDuration
{
    if (animationDuration <= 0) // instant
        [view removeFromSuperview];
    else { // animated
        [view setTranslatesAutoresizingMaskIntoConstraints:YES];
        CGRect offScreenFrame = [self frameOffScreenBottomFromView:view viewHeigth:viewHeight];
        [UIView animateWithDuration:animationDuration
            animations:^{
                view.frame = offScreenFrame;
            }
            completion:^(BOOL finished) {
                [view removeFromSuperview];
            }];
    }
}

#pragma mark : helpers

+ (CGRect)frameOnScreenBottomFromView:(UIView*)view viewHeigth:(float)viewHeight
{
    CGRect viewRect = view.frame;
    return CGRectMake(0, [self windowHeight] - viewHeight, viewRect.size.width, viewHeight);
}

+ (CGRect)frameOffScreenBottomFromView:(UIView*)view viewHeigth:(float)viewHeight
{
    CGRect viewRect = view.frame;
    return CGRectMake(0, [self windowHeight] + viewHeight, viewRect.size.width, viewHeight);
}

+ (UIApplication*)application
{
    return [UIApplication sharedApplication];
}

+ (UIWindow*)window
{
    return [self application].keyWindow;
}

+ (CGRect)windowFrame
{
    return [self window].frame;
}

+ (CGFloat)windowHeight
{
    return [self windowFrame].size.height;
}

+ (CGFloat)windowWidth
{
    return [self windowFrame].size.width;
}

@end
