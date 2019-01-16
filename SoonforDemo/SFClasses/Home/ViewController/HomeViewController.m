//
//  HomeViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/8.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "HomeViewController.h"
#import "SFLabelViewController.h"
#import "SFTextViewViewController.h"
#import "SFButtonViewController.h"
#import "SFTextFieldViewController.h"
#import "SFAlterViewVC.h"
#import "SFPageStyleViewController.h"
#import "SFPhotosPickerVC.h"
#import "SFDatePickerVC.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self createUI];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    cell.textLabel.text = self.listArray[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.listArray[indexPath.row][@"detail"];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = self.listArray[indexPath.row][@"title"];
    
    if(SFStringEqual(name, @"Label")){
        
        SFLabelViewController *vc = [SFLabelViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"TextView")){
        SFTextViewViewController *vc = [SFTextViewViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (SFStringEqual(name, @"Button")){
        SFButtonViewController *vc = [SFButtonViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (SFStringEqual(name, @"TextField")) {
        SFTextFieldViewController *vc = [SFTextFieldViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (SFStringEqual(name, @"AlertView")){
        SFAlterViewVC *vc = [SFAlterViewVC new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (SFStringEqual(name, @"PageView")){
        SFPageStyleViewController *vc = [SFPageStyleViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (SFStringEqual(name, @"photoView")){
        SFPhotosPickerVC *vc = [SFPhotosPickerVC new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if (SFStringEqual(name, @"pickView")){
        SFDatePickerVC *vc = [SFDatePickerVC new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}
- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [NSMutableArray arrayWithObjects:
  @{@"title":@"AFNetWorking",@"detail":@"网络请求"},
  @{@"title":@"Label",@"detail":@"Label自定义：内边距，外边距，富文本"},
  @{@"title":@"TextView",@"detail":@"TextView自定义，placeholder，字数限制和显示"},
  @{@"title":@"TextField",@"detail":@"TextField自定义，字数限制,键盘限制"},
  @{@"title":@"Button",@"detail":@"Button自定义：图片与文字"},
  @{@"title":@"AlertView",@"detail":@"自定义弹框：封装UIAlerViewController，自定义UI弹框"},
  @{@"title":@"PageView",@"detail":@"滚动菜单栏"},
  @{@"title":@"photoView",@"detail":@"多图选择，单图选择，上传图片，浏览图片"},
  @{@"title":@"popoverPresentationController",@"detail":@"下拉菜单"},
  @{@"title":@"pickView",@"detail":@"时间选择器，日期选择器，性别选择，省市区选择"},
                      
  nil];
    }
    return _listArray;
}
- (void)createUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 60.0;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
        [self.view addSubview:_tableView];
        
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
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
