//
//  UINavigationBar+AddBg.m
//  CustomTabbarTest
//
//  Created by Leelen-mac1 on 14-3-19.
//  Copyright (c) 2014年 Leelen. All rights reserved.
//

#import "UINavigationBar+AddBg.h"

@implementation UINavigationBar (AddBg)

- (void)awakeFromNib
{

    [self setBackgroundImage:[UIImage imageNamed:@"navbar_bg"]
               forBarMetrics:UIBarMetricsDefault];
    NSDictionary *textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:20],
                           NSForegroundColorAttributeName: [UIColor whiteColor],
                           };
    [self setTitleTextAttributes:textAttributes];
    
}
@end
