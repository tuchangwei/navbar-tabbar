//
//  ViewController.m
//  CustomTabbarTest
//
//  Created by Leelen-mac1 on 14-3-19.
//  Copyright (c) 2014年 Leelen. All rights reserved.
//

#import "ViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface ViewController ()<RDVTabBarControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"立林智慧社区";
    ;
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    RDVTabBarController *tabbarViewController = segue.destinationViewController;
    
    UIViewController *firstViewController = [[UIViewController alloc] init];
    firstViewController.title = @"可视对讲";
    UIViewController *secondViewController = [[UIViewController alloc] init];
    secondViewController.title = @"通话记录";
    UIViewController *thirdViewController = [[UIViewController alloc] init];
    thirdViewController.title = @"联系人";
    
    [tabbarViewController setViewControllers:@[firstViewController,secondViewController,thirdViewController]];
    tabbarViewController.delegate = self;
    tabbarViewController.title = firstViewController.title;
    [self customizeTabBarForController:tabbarViewController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_clicked"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_bg"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {
        //item.title = @"Contact";
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:@"contact_highlight"];
        UIImage *unselectedimage = [UIImage imageNamed:@"contact"];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.selectedTitleAttributes = @{
                                         NSFontAttributeName: [UIFont systemFontOfSize:12],
                                         NSForegroundColorAttributeName: setColor(5, 161, 461, 1)
                                         };
        item.unselectedTitleAttributes = @{
                                         NSFontAttributeName: [UIFont systemFontOfSize:12],
                                         NSForegroundColorAttributeName: setColor(158, 160, 167, 1)
                                         };
        index++;
    }
}

# pragma mark - RDVTabBarControllerDelegate
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    tabBarController.title = viewController.title;
}
@end
