//
//  SecondViewController.m
//  HMSlideInViewExample
//
//  Created by HelloMihai on 8/26/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import "SecondViewController.h"
#import "HMSlideInView.h"

@interface SecondViewController ()

@property (strong, nonatomic) IBOutlet UIView *popupView;

@end

static float const POPVIEW_HEIGHT = 272;

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self popupHide:0];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self popupHide:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popupShowTapped:(id)sender
{
    [self popupShow];
}

- (IBAction)popupHideTapped:(id)sender
{
    [self popupHide:0.5];
}

- (void)popupHide:(float)animationDuration
{
    [HMSlideInView hideAtBottomView:self.popupView viewHeight:POPVIEW_HEIGHT withAnimationDuration:animationDuration];
}

- (void)popupShow
{
    [HMSlideInView showAtBottomView:self.popupView viewHeight:POPVIEW_HEIGHT withAnimationDuration:0.5 onViewController:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
