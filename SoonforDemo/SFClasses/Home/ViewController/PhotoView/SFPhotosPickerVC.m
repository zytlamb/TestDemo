//
//  SFPhotosPickerVC.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/27.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFPhotosPickerVC.h"
#import "PicturesToChooseView.h"



@interface SFPhotosPickerVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) PicturesToChooseView *picturesToChooseView;
@property (nonatomic, strong) UIImageView *cellImgV;

@end

@implementation SFPhotosPickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片选择";
    [self createUI];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    if (indexPath.row == 0) {
        _picturesToChooseView = [[PicturesToChooseView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, 75)];
        _picturesToChooseView.backgroundColor = [UIColor blackColor];
        _picturesToChooseView.clearance = 15;
        _picturesToChooseView.imgNum = 6;
        [cell addSubview:_picturesToChooseView];
        __weak typeof(self) weakSelf = self;
        [_picturesToChooseView setPicturesToChooseView:^(NSMutableArray *dataList, NSMutableArray *chooseList) {
            weakSelf.picturesToChooseView.dataList = dataList;
            weakSelf.picturesToChooseView.chooseList = chooseList;
        }];
    }else if(indexPath.row == 1){
        _cellImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
        
        [cell addSubview:_cellImgV];
    }
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}
- (void)createUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
/**
- (PicturesToChooseView *)picturesToChooseView{
    if (!_picturesToChooseView) {
        _picturesToChooseView = [[PicturesToChooseView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, 75)];
        _picturesToChooseView.backgroundColor = [UIColor grayColor];
        _picturesToChooseView.clearance = 15;
        
        __weak typeof(self) weakSelf = self;
        [_picturesToChooseView setPicturesToChooseView:^(NSMutableArray *dataList, NSMutableArray *chooseList) {
            weakSelf.picturesToChooseView.dataList = dataList;
            weakSelf.picturesToChooseView.chooseList = chooseList;
        }];
    }
    return _picturesToChooseView;
}
 */
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
- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [NSMutableArray new];
    }
    return _listArray;
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
