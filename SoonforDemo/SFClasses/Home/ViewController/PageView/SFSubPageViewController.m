//
//  SFSubPageViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/12.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFSubPageViewController.h"
#import "SFMenuBarView.h"

@interface SFSubPageViewController ()
@property (nonatomic, strong) SFMenuBarView *menuBarView;
@end

@implementation SFSubPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if (_pageIndex == 0) {
//        self.view.backgroundColor = SFRedColor;
//    }else if (_pageIndex == 1){
//        self.view.backgroundColor = SFTextColor8;
//    }
    [self label:_titleStr];
//    [self createUI];
//    [_menuBarView updateMenuBarTitles:@[@"最新",@"人气",@"点赞",@"收藏"]];
}
- (SFMenuBarView *)menuBarView {
    if (!_menuBarView) {
        _menuBarView = [[SFMenuBarView alloc] init];
        _menuBarView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_menuBarView];
        
        
    }
    return _menuBarView;
}
- (void)createUI {
    [_menuBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(SFNavbar_Height*2);
        make.height.mas_equalTo(44);
    }];
}
- (void)label:(NSString *)text {
    UILabel *label = [UILabel labelWithTextColor:SFblueColor fontSize:20];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
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
