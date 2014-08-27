## HMSlideInView

This "slide in view" is meant to allow custom views to replace inputView default window.

![HMSlideInView](HMSlideInViewExample.gif)

### Usage

```objective-c

  // in your storyboard view controller add a UIView and note the height

  // viewDidLoad:
  call to hide view with animation duration 0

  // viewWillDisappear:animated
  call to hide view with animation duration 0

  // to show the view
  [HMSlideInView showAtBottomView:self.popupView viewHeight:POPVIEW_HEIGHT withAnimationDuration:0.5 onViewController:self];

  // to hide the view
  [HMSlideInView hideAtBottomView:self.popupView viewHeight:POPVIEW_HEIGHT withAnimationDuration:animationDuration];

```
### Contact
http://hellomihai.wordpress.com/

### License

Available under the MIT License. See the LICENSE file for more.