//
//  MineOpinionImgCollCell.m
//  JMX
//
//  Created by 今日 on 2018/9/25.
//  Copyright © 2018年 daocao. All rights reserved.
//

#import "MineOpinionImgCollCell.h"
#import "TZImagePickerController.h"

#import "TZImageManager.h"
#import "UIView+Additions.h"

@interface MineOpinionImgCollCell ()<UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic,strong) NSMutableArray *imgViewArr;
@property (nonatomic,strong) NSMutableArray *selectedAssets;
@property (nonatomic,assign) NSInteger maxNum;

@end

@implementation MineOpinionImgCollCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    if (self) {
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 初始化
-(void)initialize{
}
#pragma mark - 创建UI
-(void)createUI{
}
#pragma mark - 私有方法
#pragma mark - 公有方法
-(void)update:(NSIndexPath *)index imgArr:(NSMutableArray *)imgArr chooseArr:(NSMutableArray *)chooseArr num:(NSInteger)num{
    if (index.row >= imgArr.count) {
        self.imgView.hidden = YES;
        self.cancelBtn.hidden = YES;
        self.addBtn.hidden = NO;
        self.selectedAssets = chooseArr;
        self.addBtn.tag = 99;
    }else{
        self.imgView.hidden = NO;
        self.cancelBtn.hidden = NO;
        self.cancelBtn.tag = index.row;
//        self.addBtn.hidden = YES;
        self.addBtn.hidden = NO;
        self.imgView.image = [imgArr objectAtIndex:index.row];
        self.selectedAssets = chooseArr;
        self.imgViewArr = imgArr;
    }
    self.maxNum = num;
    if (imgArr.count < num) {
        self.addBtn.hidden = NO;
    }else{
        self.addBtn.hidden = YES;
    }
    
}
#pragma mark - 代理方法
- (void)photoSelect {
    __weak typeof(self) weakSelf = self;
    [SFAlertController AlertViewWithTitle:nil message:nil cancelTitle:@"取消" acitons:@[@"相机",@"从相册获取"] style:SFAlertViewSheet inView:self itemblock:^(NSInteger itemIndex) {
        if (itemIndex == 1) {
            NSLog(@"self.selectedAssets = %@",self.selectedAssets);
            [weakSelf takePhoto];
        }else if (itemIndex == 2) {
            NSLog(@"self.selectedAssets = %@",self.selectedAssets);
            [weakSelf pushImagePickerController];
        }
        
    }];
}
- (void)getImage:(TZImagePickerController *)imagePicker{
    
    //MARK: 你可以通过block或者代理，来得到用户选择的照片.
    __weak typeof(self) weakSelf = self;
    [imagePicker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        weakSelf.selectedAssets =   [NSMutableArray arrayWithArray:assets];
        weakSelf.imgViewArr = [NSMutableArray arrayWithArray:photos];
//
//        NSIndexPath *index = [NSIndexPath indexPathForRow:1 inSection:1];
//        [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
        if (self.updateUIBlock) {
            self.updateUIBlock(weakSelf.imgViewArr,weakSelf.selectedAssets);
        }
    }];
    
}
// MARK: 调起相册
- (void)pushImagePickerController {
    
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:self.maxNum columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
//    imagePicker.selectedAssets = self.imgViewArr;
    // 2. 在这里设置imagePickerVc的外观
    imagePicker.navigationBar.barTintColor = [UIColor blackColor];
    imagePicker.navigationBar.tintColor = [UIColor blackColor];
    imagePicker.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor blackColor],
      NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
    
    // 3. 设置是否可以选择视频/图片/原图
    imagePicker.allowPickingVideo = NO;
    imagePicker.allowPickingImage = YES;
    imagePicker.allowPickingOriginalPhoto = YES;
    imagePicker.allowPickingGif = YES;
    imagePicker.allowTakePicture = NO;
    /// 5. 单选模式,maxImagesCount为1时才生效
    //    imagePickerVc.showSelectBtn = NO;
    imagePicker.allowCrop = YES;//是否需要裁剪
    
    imagePicker.selectedAssets = self.selectedAssets;
    
    [self getImage:imagePicker];
    [self.viewController presentViewController:imagePicker animated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    }];
}

- (void)takePhoto {
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) && iOS7Later) {
        // 无相机权限 做一个友好的提示
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        [alert show];
        // 拍照之前还需要检查相册权限
    } else if ([[TZImageManager manager] authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.tag = 1;
        [alert show];
    } else if ([[TZImageManager manager] authorizationStatus] == 0) { // 正在弹框询问用户是否允许访问相册，监听权限状态
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            return [self takePhoto];
        });
    } else { // 调用相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerVc.sourceType = sourceType;
            if(iOS8Later) {
                _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            }
            [self.viewController presentViewController:_imagePickerVc animated:YES completion:nil];
        } else {
            NSLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
}

//MARK: 拍照完毕
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    __weak typeof(self) weakSelf = self;
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        
        TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:nil];
        tzImagePickerVc.sortAscendingByModificationDate = YES;
        [tzImagePickerVc showProgressHUD];
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image completion:^(NSError *error){
            if (error) {
                [tzImagePickerVc hideProgressHUD];
                NSLog(@"图片保存失败 %@",error);
            } else {
                [[TZImageManager manager] getCameraRollAlbum:NO allowPickingImage:YES completion:^(TZAlbumModel *model) {
                    [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:NO allowPickingImage:YES completion:^(NSArray<TZAssetModel *> *models) {
                        [tzImagePickerVc hideProgressHUD];
                        TZAssetModel *assetModel = [models firstObject];
                        if (tzImagePickerVc.sortAscendingByModificationDate) {
                            assetModel = [models lastObject];
                        }
                        
                        [weakSelf.selectedAssets addObject:assetModel.asset];
                        [weakSelf.imgViewArr addObject:image];
//                        NSIndexPath *index = [NSIndexPath indexPathForRow:1 inSection:1];
//                        [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
                        if (self.updateUIBlock) {
                            self.updateUIBlock(weakSelf.imgViewArr,weakSelf.selectedAssets);
                        }
                    }];
                }];
            }
        }];
    }
}

#pragma mark - 通知事件
#pragma mark - 点击事件
- (IBAction)addImgClick:(UIButton *)sender {
    //添加图片
    if (sender.tag == 99) {
        [self photoSelect];
    }
}
- (IBAction)cancelClick:(UIButton *)sender {
    //删除图片
    [self.imgViewArr removeObjectAtIndex:sender.tag];
    [self.selectedAssets removeObjectAtIndex:sender.tag];
    if (self.updateUIBlock) {
        self.updateUIBlock(self.imgViewArr,self.selectedAssets);
    }
}

#pragma mark - 网络请求
#pragma mark - 懒加载
-(NSMutableArray *)imgViewArr{
    if (!_imgViewArr) {
        _imgViewArr = [[NSMutableArray alloc] init];
    }
    return _imgViewArr;
}
-(NSMutableArray *)selectedAssets{
    if (!_selectedAssets) {
        _selectedAssets = [[NSMutableArray alloc] init];
    }
    return _selectedAssets;
}
@end
