//
//  SFCustomAlterView.m
//  SFDesigner
//
//  Created by Dev SoonFor on 2018/4/2.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFCustomAlterView.h"

@interface  SFCustomAlterView ()<UIGestureRecognizerDelegate>
@property (nonatomic, retain) UIView *alterView;
@property (nonatomic, retain) UILabel *titleLb;
@property (nonatomic, retain) UILabel *contentLb;
@property (nonatomic, retain) UIButton *cancelBt;
@property (nonatomic, retain) UIButton *sureBt;
@property (nonatomic, retain) UIView *upLine;
@property (nonatomic, retain) UIView *middleLine;
@property (nonatomic, retain) UIView *downLine;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *cancel;
@property (nonatomic, copy) NSString *sure;
@property (nonatomic, assign) BOOL isCanCancel;//点空白处是否可以取消
@property (nonatomic, assign) SFAlterType alterType;

@end

@implementation SFCustomAlterView
- (void)show {
    [[APPDELEGATE window] addSubview:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _alterView = [[UIView alloc] init];
        _alterView.backgroundColor = [UIColor whiteColor];
        _alterView.layer.cornerRadius=2;
        _alterView.layer.masksToBounds=YES;
        _alterView.userInteractionEnabled = YES;
        [self addSubview:_alterView];
        [_alterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(0);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9);
           // make.height.mas_equalTo(kSCREENHEIGHT*0.25);
        }];
        
        //标题
        _titleLb = [UILabel labelWithTextColor:[UIColor blackColor] fontSize:18];
        _titleLb.textAlignment=NSTextAlignmentCenter;
        [_alterView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.alterView.mas_top).mas_offset(10);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9);
            make.height.mas_equalTo(SFSCREENHEIGHT*0.25*0.28);
        }];
        
        
        _upLine = [[UIView alloc]init];
        _upLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_alterView addSubview:_upLine];
        [_upLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self->_titleLb.mas_bottom);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9);
            make.height.mas_equalTo(0.5);
        }];
        
        //取消按钮
        _cancelBt = [[UIButton alloc]init];
        _cancelBt.titleLabel.font = [UIFont systemFontOfSize:SFScaleFrom_iPhone6_Desgin(14)];
        [_cancelBt setTitleColor:SFRedColor forState:UIControlStateNormal];
        [_cancelBt addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [_alterView addSubview:_cancelBt];
        [_cancelBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self->_alterView.mas_bottom);
            make.left.mas_equalTo(self->_alterView.mas_left);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9/2);
            make.height.mas_equalTo(SFSCREENHEIGHT*0.25*0.26);
        }];
        //确定按钮
        _sureBt = [[UIButton alloc]init];
        _sureBt.titleLabel.font = [UIFont systemFontOfSize:SFScaleFrom_iPhone6_Desgin(14)];
        [_sureBt setTitleColor:SFRedColor forState:UIControlStateNormal];
        [_sureBt addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [_alterView addSubview:_sureBt];
        [_sureBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self->_alterView.mas_bottom);
            make.right.mas_equalTo(self->_alterView.mas_right);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9/2-0.5);
            make.height.mas_equalTo(SFSCREENHEIGHT*0.25*0.26);
        }];
        
        _middleLine = [[UIView alloc]init];
        _middleLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_alterView addSubview:_middleLine];
        [_middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self->_alterView.mas_bottom);
            make.left.mas_equalTo(self->_cancelBt.mas_right);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(SFSCREENHEIGHT*0.25*0.26);
        }];
        _downLine = [[UIView alloc]init];
        _downLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_alterView addSubview:_downLine];
        [_downLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(self->_cancelBt.mas_top);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9);
            make.height.mas_equalTo(0.5);
        }];
        
        //内容
        _contentLb = [UILabel labelWithTextColor:[UIColor blackColor] fontSize:14];
        _contentLb.numberOfLines = 0;
        [_alterView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self->_upLine.mas_bottom).mas_offset(SFScaleFrom_iPhone6_Desgin(15));
            make.width.mas_equalTo(SFSCREENWIDTH*0.9-20);
            make.bottom.mas_equalTo(self->_downLine.mas_top).mas_offset(-SFScaleFrom_iPhone6_Desgin(15));
        }];
        
        //创建textView
        _contentTF =[[UITextField alloc]init];
        _contentTF.backgroundColor= SFRGB_Color(246, 247, 248);
//        _contentTF.placeholder = @"请输入拒绝原因";
        _contentTF.textColor = [UIColor blackColor];
        [_alterView addSubview:_contentTF];
        [_contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self->_upLine.mas_bottom).mas_offset(10);
            make.width.mas_equalTo(SFSCREENWIDTH*0.9-20);
            make.bottom.mas_equalTo(self->_downLine.mas_top).mas_offset(-10);
            make.height.mas_greaterThanOrEqualTo(SFScaleFrom_iPhone6_Desgin(44));
        }];
        
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeAlertView)];
        tapG.delegate = self;
        [self addGestureRecognizer:tapG];
    }
    return self;
}
#pragma mark----实现类方法
//+(instancetype)alterViewWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancel sure:(NSString *)sure cancelBtClcik:(cancelBlock)cancelBlock sureBtClcik:(sureBlock)sureBlock
//{
//    SFCustomAlterView *alterView = [[SFCustomAlterView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, SFSCREENHEIGHT)];
//    alterView.backgroundColor = SFRGBA_Color(0, 0, 0, 0.3);
//    alterView.title = title;
//    alterView.content = content;
//
//    alterView.cancel = cancel;
//    alterView.sure = sure;
//    alterView.cancel_block = cancelBlock;
//    alterView.sure_block = sureBlock;
//
//    return alterView;
//}
#pragma mark--给属性重新赋值
- (void)setTitle:(NSString *)title
{
    _titleLb.text = title;
}
- (void)setContent:(NSString *)content
{
    if (_alterType == SFAlterTypeText) {
        _contentTF.placeholder = content;
    }else if (_alterType == SFAlterTypeLabel){
        _contentLb.text = content;
    }
  
    
}
- (void)setAlterType:(SFAlterType)alterType {
    _alterType = alterType;
    if (_alterType == SFAlterTypeText) {
        _contentTF.placeholder = _content;
    }else if (_alterType == SFAlterTypeLabel){
        _contentLb.text = _content;
    }
}
- (void)setSure:(NSString *)sure
{
    [_sureBt setTitle:sure forState:UIControlStateNormal];
}
- (void)setCancel:(NSString *)cancel
{
    [_cancelBt setTitle:cancel forState:UIControlStateNormal];
}

#pragma mark----取消按钮点击事件
- (void)cancelBtClick
{
    [self removeFromSuperview];
    self.cancel_block();
}
#pragma mark----确定按钮点击事件
- (void)sureBtClick
{
    [self removeFromSuperview];
    self.sure_block(self.contentTF.text);
    
}

/*
 用于排除点击了警告框也相应该方法
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:_alterView]) {
        return NO;
    }
    return YES;
}

-(void)removeAlertView
{
    [self endEditing:YES];
    if(self.isCanCancel)
    [self removeFromSuperview];
}

+ (instancetype)alterViewWithTitle:(NSString *)title
                         alterType:(SFAlterType)alterType
                           content:(NSString *)content
                            cancel:(NSString *)cancel
                              sure:(NSString *)sure
                     cancelBtClcik:(cancelBlock)cancelBlock
                       sureBtClcik:(sureBlock)sureBlock {
    
    SFCustomAlterView *alterView = [[SFCustomAlterView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, SFSCREENHEIGHT)];
    
    alterView.backgroundColor = SFRGBA_Color(0, 0, 0, 0.3);
    alterView.title = title;
    alterView.alterType = alterType;
    if (alterType == SFAlterTypeLabel) {
        alterView.contentTF.hidden = YES;
        alterView.content = content;
    }else if (alterType == SFAlterTypeText) {
        alterView.contentLb.hidden = YES;
        alterView.contentTF.placeholder = content;
        if ([content containsString:@"电话"]||[content containsString:@"手机"]) {
            alterView.contentTF.keyboardType = UIKeyboardTypePhonePad;
        }
    }
    
    alterView.cancel = cancel;
    alterView.sure = sure;
    alterView.cancel_block = cancelBlock;
    alterView.sure_block = sureBlock;
    
    return alterView;
}

+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                             sure:(NSString *)sure
                      sureBtClcik:(sureBlock)sureBlock
{
    SFCustomAlterView *alterView = [[SFCustomAlterView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, SFSCREENHEIGHT)];
    
    alterView.backgroundColor = SFRGBA_Color(0, 0, 0, 0.3);
    alterView.title = title;
    alterView.content = content;
    alterView.sure = sure;
    alterView.sure_block = sureBlock;
    
    [alterView.contentLb setTextAlignment:NSTextAlignmentCenter];
    alterView.contentTF.hidden = YES;
    alterView.cancelBt.hidden = YES;
    alterView.middleLine.hidden = YES;
    alterView.upLine.hidden = YES;
    
    [alterView.sureBt mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SFSCREENWIDTH*0.9);
    }];
    
    return alterView;
}


+(instancetype)alterViewNoLineWithTitle:(NSString *)title
                           content:(NSString *)content
                            cancel:(NSString *)cancel
                              sure:(NSString *)sure
                     cancelBtClcik:(cancelBlock)cancelBlock
                            sureBtClcik:(sureBlock)sureBlock CanCancel:(BOOL)CanCancel
{
    SFCustomAlterView *alterView = [[SFCustomAlterView alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, SFSCREENHEIGHT)];
    
    alterView.backgroundColor = SFRGBA_Color(0, 0, 0, 0.3);
    alterView.title = title;
    alterView.content = content;
    alterView.sure = sure;
    alterView.cancel = cancel;
    alterView.isCanCancel = CanCancel;
    alterView.sure_block = sureBlock;
    alterView.cancel_block = cancelBlock;
    [alterView.contentLb setTextAlignment:NSTextAlignmentCenter];
    alterView.contentTF.hidden = YES;
    alterView.upLine.hidden = YES;
    return alterView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
