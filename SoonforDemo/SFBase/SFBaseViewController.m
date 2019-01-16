//
//  SFBaseViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFBaseViewController ()
@property(nonatomic,copy)tapBlock leftOneBlock;
@property(nonatomic,copy)tapBlock leftTwoBlock;
@property(nonatomic,copy)tapBlock rigthOneBlock;
@property(nonatomic,copy)tapBlock rigthTwoBlock;
@end

@implementation SFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
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
