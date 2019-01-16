//
//  PicturesToChooseView.m
//  PicturesToChooseDemo
//
//  Created by 今日 on 2018/9/27.
//  Copyright © 2018年 今日. All rights reserved.
//

#import "PicturesToChooseView.h"
#import "MineOpinionImgCollCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kSw(a) (a / 375.) * kScreenWidth
#define kSh(a) (a / 667.) * kScreenHeight

@interface PicturesToChooseView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation PicturesToChooseView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
        [self createUI];
    }
    return self;
}

#pragma mark - 初始化
-(void)initialize{
    self.imgSize = CGSizeMake(kSw(53), kSh(53));
    self.clearance = kSw(15);
    self.screenDistance = kSw(0);
    self.imgNum = 99;
}
#pragma mark - 创建UI
-(void)createUI{
    self.collectionView.frame = self.bounds;
}
#pragma mark - 私有方法
#pragma mark - 公有方法
#pragma mark - 代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    if (indexPath.row >= self.dataList.count) {
        MineOpinionImgCollCell *cell = (MineOpinionImgCollCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MineOpinionImgCollCell" forIndexPath:indexPath];
        [cell update:indexPath imgArr:self.dataList chooseArr:self.chooseList num:self.imgNum];
        [cell setUpdateUIBlock:^(NSMutableArray *arr, NSMutableArray *chooseArr) {
            if (weakSelf.picturesToChooseView) {
                weakSelf.picturesToChooseView(arr,chooseArr);
            }

        }];
        return cell;
    }else{
        MineOpinionImgCollCell *cell = (MineOpinionImgCollCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MineOpinionImgCollCell" forIndexPath:indexPath];
        [cell update:indexPath imgArr:self.dataList chooseArr:self.chooseList num:self.imgNum];
        [cell setUpdateUIBlock:^(NSMutableArray *arr, NSMutableArray *chooseArr) {
            if (weakSelf.picturesToChooseView) {
                weakSelf.picturesToChooseView(arr,chooseArr);
            }
        }];
        return cell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    CGFloat weight = kSw(53);
//    CGFloat hight = kSh(53);
//    return CGSizeMake(weight, hight);
    return self.imgSize;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, self.clearance, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return self.screenDistance;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
#pragma mark - 通知事件
#pragma mark - 点击事件
#pragma mark - 网络请求
#pragma mark - 懒加载
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置collectionView滚动方向
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        //2.初始化collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[MineOpinionImgCollCell class] forCellWithReuseIdentifier:@"MineOpinionImgCollCell"];

        //4.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
-(void)setImgSize:(CGSize)imgSize{
    _imgSize = imgSize;
    [self.collectionView reloadData];
}
-(void)setClearance:(NSInteger)clearance{
    _clearance = clearance;
    [self.collectionView reloadData];
}
-(void)setDataList:(NSMutableArray *)dataList{
    _dataList = dataList;
    [self.collectionView reloadData];
}

@end
