//
//  SFNavigationViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFNavigationViewController.h"

@interface SFNavigationViewController ()

@end

@implementation SFNavigationViewController
+ (SFNavigationViewController *)createRootVC:(UIViewController *)vc {
    
    SFNavigationViewController *naviVC = [[SFNavigationViewController alloc] initWithRootViewController:vc];
    return naviVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:SFTextColor3,NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    
    self.navigationBar.translucent = NO;//1、导航栏不模糊，2、view的高度从导航栏底部开始
    self.edgesForExtendedLayout = UIRectEdgeNone;//指定边缘要延伸的方向，它的默认值很自然地是UIRectEdgeAll，四周边缘均延伸，就是说，如果即使视图中上有navigationBar，下有tabBar，那么视图仍会延伸覆盖到四周的区域。将属性设置为UIRectEdgeNone  被上面两个属性坑死了
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
