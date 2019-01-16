//
//  SFMenuBarVC.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/26.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFMenuBarVC.h"
#import "SFMenuBarView.h"

@interface SFMenuBarVC ()<SFMenuBarViewDelegate>

@property (nonatomic, strong) SFMenuBarView *menuBarView;
@property (nonatomic, strong) SFMenuBarView *bottomMenuBarView;
@property (nonatomic, assign) NSInteger lastIndex;
@end

@implementation SFMenuBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MenuView";
    [self topMenuView];
    [self bottomMenuView];
    
}
- (void)topMenuView {
    _menuBarView = [[SFMenuBarView alloc] init];
    _menuBarView.delegate = self;
    
    [self.view addSubview:_menuBarView];
    [_menuBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    [_menuBarView updateMenuBarTitles:@[@"最新",@"人气",@"点赞",@"收藏"]];
    [_menuBarView showBottomLine];
}
- (void)bottomMenuView {
    _bottomMenuBarView = [[SFMenuBarView alloc] init];
    _bottomMenuBarView.delegate = self;
    
    [self.view addSubview:_bottomMenuBarView];
    [_bottomMenuBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    [_bottomMenuBarView updateMenuBarTitles:@[@"最新",@"人气",@"点赞",@"收藏"] barImgs:@[@"collect",@"support",@"icn_guanzhu",@""]];
    [_bottomMenuBarView showTopLine];

}
- (void)menuBarViewSelectItemIndex:(NSInteger)index button:(UIButton *)button {
//    [button setTitleColor:SFRedColor forState:UIControlStateSelected];
//    if (button.tag == index+100) {
//        button.selected = YES;
//        
//    }else {
//        button.selected = NO;
//    }
    
//     _lastIndex = index;
//    switch (index) {
//        case 0:
//        {
//            [button setTitleColor:SFRedColor forState:UIControlStateNormal];
//        }
//            break;
//        case 1:
//        {
//
//        }
//            break;
//        case 2:
//        {
//
//        }
//            break;
//        case 3:
//        {
//
//        }
//            break;
//        default:
//            break;
//    }
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
