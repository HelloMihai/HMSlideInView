//
//  Created by HelloMihai on 8/7/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import <Foundation/Foundation.h>

@interface HMSlideInView : NSObject

+ (void)showAtBottomView:(UIView*)view viewHeight:(float)viewHeight withAnimationDuration:(float)animationDuration onViewController:(UIViewController*)onViewController;
+ (void)hideAtBottomView:(UIView*)view viewHeight:(float)viewHeight withAnimationDuration:(float)animationDuration;

@end
