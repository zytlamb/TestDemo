//
//  SFCustomTextView.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFCustomTextView.h"

@interface SFCustomTextView ()<UITextViewDelegate>
@property (strong, nonatomic) UILabel *surplusLbl; // 剩余可输入字数
@end

@implementation SFCustomTextView
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
        self.autoAdpterRect = NO;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self initialize];
        self.autoAdpterRect = NO;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self updateSurplusLable];
}
- (void)setText:(NSString *)text {
    [super setText:text];
    [self updateSurplusLable];
}

- (void)updateSurplusLable {
    if(self.maxLength > 0){
        self.surplusLbl.font = self.font;
        self.surplusLbl.numberOfLines = 0;
        self.surplusLbl.textAlignment = NSTextAlignmentRight;
        self.surplusLbl.textColor = SFHexColor(@"BBC7D6");
        [self.surplusLbl sizeToFit];
        NSString *str = @"";
        if (self.maxLength != NSUIntegerMax && self.maxLength != 0 && self.text.length > self.maxLength) {//超出范围
            str = [NSString stringWithFormat:@"-%ld",self.text.length - self.maxLength];
            self.surplusLbl.textColor = [UIColor redColor];
        }
        else{
            if (self.text.length == 0) {
                str = [NSString stringWithFormat:@"%ld以内",self.maxLength];
            }else {
                str = [NSString stringWithFormat:@"%lu/%ld",self.text.length,self.maxLength];
            }
            
            self.surplusLbl.textColor = SFHexColor(@"BBC7D6");
        }
        
        self.surplusLbl.text = str;
        self.surplusLbl.frame = CGRectMake(4,self.bounds.size.height + self.contentOffset.y - self.font.pointSize, self.bounds.size.width-8,self.font.pointSize);
        
        
    }
}
- (UILabel *)surplusLbl{
    if (!_surplusLbl) {
        UILabel *surplusLbl = [[UILabel alloc]init];
        _surplusLbl = surplusLbl;
        [self addSubview:_surplusLbl];
    }
    return _surplusLbl;
}
-(void)initialize{
    //设置默认值
    self.maxLength = 0;
    
    //设置基本属性
    self.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    self.font = [UIFont systemFontOfSize:14];
    self.backgroundColor = [UIColor whiteColor];
    
    //设置代理
    self.delegate = self;
}


#pragma mark - textViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    //如果用户点击了return
    if([text isEqualToString:@"\n"]){
        if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextViewShouldReturn:)]) {
            return [_textDelegate customTextViewShouldReturn:textView];
        }
        return NO;
    }
    if (self.autoAdpterRect) {
        //如果用户点击了删除
        if ([text isEqualToString:@""]) {
            
            CGRect frame = textView.frame;
            CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
            CGSize size = [textView sizeThatFits:constraintSize];
            textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
        }
    }
    
    
    //长度限制操作
    NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
    
    if (str.length > self.maxLength && self.maxLength){
        
        NSRange rangeIndex = [str rangeOfComposedCharacterSequenceAtIndex:self.maxLength];
        
        if (rangeIndex.length == 1){//字数超限
            textView.text = [str substringToIndex:self.maxLength];
            //记录输入的字数
            self.inputLength = textView.text.length;
            [self updateSurplusLable];
            if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextViewDidChange:)]) {
                [_textDelegate customTextViewDidChange:textView];
            }
            
        }else{
            NSRange rangeRange = [str rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxLength)];
            textView.text = [str substringWithRange:rangeRange];
        }
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length > self.maxLength && self.maxLength){
        textView.text = [textView.text substringToIndex:self.maxLength];
    }
    //记录输入的字数
    self.inputLength = textView.text.length;
    [self updateSurplusLable];
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextViewDidChange:)]) {
        [_textDelegate customTextViewDidChange:textView];
    }
    
    if (self.autoAdpterRect) {
        CGRect frame = textView.frame;
        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
        CGSize size = [textView sizeThatFits:constraintSize];
        if (size.height <= frame.size.height) {
            size.height = frame.size.height;
        }else{
            if (size.height >= _maxHeight)
            {
                size.height = _maxHeight;
                textView.scrollEnabled = YES;   // 允许滚动
            }
            else
            {
                textView.scrollEnabled = NO;    // 不允许滚动
            }
        }
        
        textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
    }

}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (_textDelegate && [_textDelegate respondsToSelector:@selector(customTextViewDidEndEditing:)]) {
        [_textDelegate customTextViewDidEndEditing:textView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
