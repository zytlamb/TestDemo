//
//  SFPageViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/11.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFPageViewController.h"
#import "SFSubPageViewController.h"
#import "SFAlterViewVC.h"

@interface SFPageViewController ()<WMPageControllerDelegate,WMPageControllerDataSource>

@end

@implementation SFPageViewController
- (WMPageController *)pageVC {
    if (!_pageVC) {
        _pageVC = [[WMPageController alloc] init];
        _pageVC.titles = _titleData;
        _pageVC.delegate = self;
        _pageVC.dataSource = self;
        _pageVC.titleSizeNormal = 15;
        _pageVC.titleSizeSelected = 15;
//        _pageVC.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
        if (_styleIndex <= 5) {
            _pageVC.menuViewStyle = _styleIndex;
        }else if(_styleIndex == 6) {
            _pageVC.menuViewStyle = WMMenuViewStyleLine;
        }else if(_styleIndex == 7) {
            _pageVC.menuViewStyle = WMMenuViewStyleFloodHollow;
        }
        if (_styleIndex == 2) {
            _pageVC.progressWidth = 13;
            _pageVC.progressHeight = 8;
        }
        _pageVC.progressColor = SFRedColor;
        if (_styleIndex == 3 || _styleIndex == 5) {
            _pageVC.titleColorNormal = SFTextColor8;
            _pageVC.titleColorSelected = SFWhiteColor;
        }else {
            _pageVC.titleColorNormal = SFTextColor8;
            _pageVC.titleColorSelected = SFRedColor;
        }
        
        
    }
    return _pageVC;
}
- (void)createUI {
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
        
    }];
}


#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return _titleData.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return _titleData[index];
}
#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    SFSubPageViewController  *vcClass = [[SFSubPageViewController alloc] init];
    vcClass.title = _titleData[index];
    vcClass.pageIndex = index;
    vcClass.titleStr = _titleData[index];
    return vcClass;
}
//设置 WMMenuView的 frame
-(CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    CGFloat menuY = 0.0;
    if (_styleIndex == 7) {
        menuY = SFStatus_Height;
    }
    CGRect menuViewFrame = CGRectMake(0, menuY, SFSCREENWIDTH, 44.0);
    return menuViewFrame;
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.pageVC.menuView]);
    
    return CGRectMake(0, originY, SFSCREENWIDTH, self.view.frame.size.height);
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(nonnull __kindof UIViewController *)viewController withInfo:(nonnull NSDictionary *)info{
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self createUI];
    if (_styleIndex == 6 || _styleIndex == 7) {
        [self updateMenuLeftView];
        [self updateMenuRightView];
    }
    
}
- (void)updateMenuRightView {
    UIButton *button = [UIButton buttonWithImageName:@"icn_shaixuan"];
    button.backgroundColor = SFColor_f0;
    button.frame = CGRectMake(0, 0, 44, 44);
    _pageVC.menuView.rightView = button;
}
- (void)updateMenuLeftView {
    UIButton *button = [UIButton buttonWithImageName:@"icn_back"];
//    button.backgroundColor = SFRGBA_Color(0, 0, 0, 0);
    button.frame = CGRectMake(0, 0, 44, 44);
    _pageVC.menuView.leftView = button;
    _pageVC.menuView.leftView.backgroundColor = [UIColor clearColor];
    
    [button addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)leftButtonClick {
    if (_styleIndex == 7) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
