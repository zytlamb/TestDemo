//
//  SFLabelViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/10.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFLabelViewController.h"
#import "SFCustomLabel.h"

@interface SFLabelViewController ()

@end

@implementation SFLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义Label";
    [self label1];
    [self label2];
    [self label3];
}
- (void)label1 {
    SFCustomLabel *lb1 = [[SFCustomLabel alloc] initWithFrame:CGRectMake(0, 0, SFSCREENWIDTH, SFSCREENHEIGHT/6)];
    lb1.text = @"云对雨，雪对风，晚照对晴空。来鸿对去燕，宿鸟对鸣虫。三尺剑，六钧弓，岭北对江东。人间清暑殿，天上广寒宫。两岸晓烟杨柳绿，一园春雨杏花红。两鬓风霜，途次早行之客；一蓑烟雨，溪边晚钓之翁。";
    lb1.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    lb1.numberOfLines = 0;
    lb1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lb1];
    [lb1 sizeToFit];//重新计算尺寸，会执行Label内重写的方法
}
- (void)label2 {
    SFCustomLabel *lb2 = [[SFCustomLabel alloc] initWithFrame:CGRectMake(0, SFSCREENHEIGHT/6+10, SFSCREENWIDTH, SFSCREENHEIGHT/6)];
    lb2.text = @"沿对革，异对同，白叟对黄童。江风对海雾，牧子对渔翁。颜巷陋，阮途穷，冀北对辽东。池中濯足水，门外打头风。梁帝讲经同泰寺，汉皇置酒未央宫。尘虑萦心，懒抚七弦绿绮；霜华满鬓，羞看百炼青铜。";
    lb2.edgeInsets = UIEdgeInsetsMake(10, 0, 10, 0);
    lb2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lb2.numberOfLines = 0;
    
    [self.view addSubview:lb2];
    [lb2 sizeToFit];//重新计算尺寸，会执行Label内重写的方法
    
}
- (void)label3 {
    SFCustomLabel *lb3 = [[SFCustomLabel alloc] initWithFrame:CGRectMake(0, SFSCREENHEIGHT/6*2+20, SFSCREENWIDTH, SFSCREENHEIGHT/5)];
    lb3.text = @"贫对富，塞对通，野叟对溪童。鬓皤对眉绿，齿皓对唇红。天浩浩，日融融，佩剑对弯弓。半溪流水绿，千树落花红。野渡燕穿杨柳雨，芳池鱼戏芰荷风。女子眉纤，额下现一弯新月；男儿气壮，胸中吐万丈长虹。";
    lb3.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    lb3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    lb3.numberOfLines = 0;
    [lb3 setLabelSpace:lb3 withValue:lb3.text withFont:[SFFont font16] withLineSpacing:6.0 withFontSpacing:1.5];
    [self.view addSubview:lb3];
    [lb3 sizeToFit];//重新计算尺寸，会执行Label内重写的方法
    
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
