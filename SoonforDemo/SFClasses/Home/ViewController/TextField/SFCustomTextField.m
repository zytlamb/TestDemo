//
//  SFCustomTextField.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFCustomTextField.h"

@interface SFCustomTextField ()<UITextFieldDelegate>

@property (nonatomic, strong) NSString *containText;

@end

@implementation SFCustomTextField
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self initializer];
    }
    self.delegate = self;
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super initWithCoder:aDecoder]) {
        [self initializer];
    }
    self.delegate = self;
    return self;
}
/**
 *  初始化
 */
- (void)initializer
{
    //注册输入通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textfieldDidChange:) name:@"UITextFieldTextDidChangeNotification" object:self];
    
}

/**
 *  text发生改变
 */
- (void)textfieldDidChange:(NSNotification *)noti
{
    
    SFCustomTextField *textField = noti.object;
    
    if (textField == self) {
        if (textField != nil) {
            if (self.max_number > 0) {
                double number = [textField.text doubleValue];
                if (self.max_number < number) {
                    NSRange range = {0,self.text.length-1};
                    self.text = [textField.text substringWithRange:range];
                    return ;
                }
            }
            /**
             *  禁止输入内容超出最大限制
             */
            if(self.max_char > 0 && textField.text.length > self.max_char) {
                NSString *toBeString = textField.text;
                NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage; // 键盘输入模式
                if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
                    UITextRange *selectedRange = [textField markedTextRange];
                    //获取高亮部分
                    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
                    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                    if (!position) {
                        if (toBeString.length > self.max_char) {
                            
                            textField.text = self.containText;
                            //                            textField.text = [self.containText substringToIndex:self.max_char];
                        }
                    }
                    // 有高亮选择的字符串，则暂不对文字进行统计和限制
                    else{
                        
                    }
                }
                // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
                else{
                    if (toBeString.length > self.max_char) {
                        //                        textField.text = self.containText;
                        textField.text = [textField.text substringToIndex:self.max_char];
                    }
                }
            }else {
                self.containText = self.text;
                
            }
            /**
             *  禁止超出X位小数点
             *///字条串是否包含有某字符串
            if (!([textField.text rangeOfString:@"."].location == NSNotFound) && self.max_numberPoint > 0) {//包含某个字符
                NSRange range = [textField.text rangeOfString:@"."]; //  从哪个位置开始截取，截取多长
                
                if (textField.text.length - range.location > self.max_numberPoint) {//超出小数点2位
                    textField.text = [textField.text substringWithRange:NSMakeRange(0, range.length + range.location+self.max_numberPoint)];//要裁剪
                }
                if(self.text.length - 1 - range.location){//小数点后面输入的内容
                    if([[self.text substringFromIndex:self.text.length-1] isEqualToString:@"."]){//裁剪小数点后面的小数点
                        textField.text  = [textField.text substringToIndex:textField.text.length - 1];
                    }
                }
            }
            
            /**
             *  block返回输入内容
             */
//            if (self.didChangeTextField) {
//                if (self.didChangeTextField) {
//                    self.didChangeTextField(textField);
//                }
//            }
        }
    }
}

/**
 输入框只能输入数字
 */
- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

/**
 输入框只能输入数字和小数点
 */
- (BOOL)validateNumberAndPoint:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:self];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.containText = self.text;
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextFieldShouldBeginEditing:)]) {
        [_textDelegate customTextFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextFieldDidEndEditing:)]) {
        [_textDelegate customTextFieldDidEndEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextFieldShouldEndEditing:)]) {
        [_textDelegate customTextFieldShouldEndEditing:textField];
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextFieldShouldClear:)]) {
        [_textDelegate customTextFieldShouldClear:textField];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextFieldShouldReturn:)]) {
        [_textDelegate customTextFieldShouldReturn:textField];
    }
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (self.isMustNumber == YES){//限制只能输入文字
        return [self validateNumber:string];//如果不是0~9
    }
    else if (self.isMustNumberOrPoint == YES)//只能输入数字和小数点
    {
        return [self validateNumberAndPoint:string];//如果不是0~9和.
    }
    
    if (self.max_char > 0) {
        NSString *lastStr = [NSString stringWithFormat:@"%@%@", textField.text, string];
        CGFloat currentByte = [self convertToByte:lastStr];
        if (currentByte > self.max_char * 2) {
            return NO;
        }else {
            return YES;
        }
    }
    return YES;
}

- (long)convertToByte:(NSString*)text {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        
        unichar uc = [text characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
        
    }
    
    NSUInteger unicodeLength = asciiLength;
    
    return unicodeLength;
}


/**
 键盘删除按钮点击
 */
- (void)deleteBackward {
    [super deleteBackward];
    if ([_textDelegate respondsToSelector:@selector(customTextFieldDeleteBackward:)]) {
        [_textDelegate customTextFieldDeleteBackward:self];
    }
}



#pragma mark -- 左边视图
//左边间隙
- (void)textfieldHaveLeftSpacing:(BOOL)haveLeftSpacing withSpacing:(CGFloat)spacing {
    if (haveLeftSpacing) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, spacing, self.bounds.size.height)];
        self.leftView = view;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
}
//左边带图片和文字
- (void)textfieldLetfImageName:(NSString *)imageName withWidth:(CGFloat)width{
    UIButton *button = [UIButton buttonWithImageName:imageName];
    button.frame = CGRectMake(0, 0, width, self.bounds.size.height);
    self.leftView = button;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)textfieldLetfTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius withLeftWidth:(CGFloat)leftWidth {
    
    UIButton *button = [UIButton buttonWithTitle:title titleColor:titleColor bgColor:bgColor radius:radius];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, leftWidth, self.bounds.size.height);
    self.leftView = button;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)textfieldLetfTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor withLeftWidth:(CGFloat)leftWidth {
    
    UIButton *button = [UIButton buttonWithTitle:title titleColor:titleColor bgColor:bgColor radius:radius borderWidth:borderWidth borderColor:borderColor];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, leftWidth, self.bounds.size.height);
    self.leftView = button;
    self.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark -- 右边视图
- (void)textfieldRightImageName:(NSString *)imageName withWidth:(CGFloat)width {
    UIButton *button = [UIButton buttonWithImageName:imageName];
    button.frame = CGRectMake(0, 0, width, self.bounds.size.height);
    self.rightView = button;
    self.rightViewMode = UITextFieldViewModeAlways;
}
- (void)textfieldRightTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius withRightWidth:(CGFloat)rightWidth {
    
    UIButton *button = [UIButton buttonWithTitle:title titleColor:titleColor bgColor:bgColor radius:radius];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, rightWidth, self.bounds.size.height);
    self.rightView = button;
    self.rightViewMode = UITextFieldViewModeAlways;
}
-(void)textfieldRightTitle:(NSString *)title TitleColor:(UIColor *)titleColor imageName:(NSString *)imageName bgColor:(UIColor *)bgColor radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor withRightWidth:(CGFloat)rightWidth {
    
    UIButton *button = [UIButton buttonWithTitle:title titleColor:titleColor bgColor:bgColor radius:radius borderWidth:borderWidth borderColor:borderColor];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, rightWidth, self.bounds.size.height);
    self.rightView = button;
    self.rightViewMode = UITextFieldViewModeAlways;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
