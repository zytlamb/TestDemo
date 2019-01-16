//
//  SFAlterViewVC.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/11.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFAlterViewVC.h"
#import "SFCustomAlterView.h"
#import "SFAlertController.h"

@interface SFAlterViewVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation SFAlterViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义AlterView";
    [self createUI];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    cell.textLabel.text = self.listArray[indexPath.row][@"title"];
    cell.textLabel.numberOfLines = 0;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = self.listArray[indexPath.row][@"title"];
    if (SFStringEqual(name, @"普通提示(只有一个“确定”按钮)")) {
        [self customAlterView1];
    }else if (SFStringEqual(name, @"普通提示文字靠左(有“取消”和“确定”按钮)")) {
        [self customAlterView2];
    }else if (SFStringEqual(name, @"普通提示文字居中(有“取消”和“确定”按钮，可以点击周边消失)")) {
        [self customAlterView4];
    }else if (SFStringEqual(name, @"带输入框提示")) {
        [self customAlterView3];
    }else if (SFStringEqual(name, @"系统提示(中间)")) {
        [self customAlterView5];
    }else if (SFStringEqual(name, @"系统提示(底部)")) {
        [self customAlterView6];
    }
}
- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [NSMutableArray arrayWithObjects:
                      @{@"title":@"普通提示(只有一个“确定”按钮)"},
                      @{@"title":@"普通提示文字靠左(有“取消”和“确定”按钮)"},
                      @{@"title":@"普通提示文字居中(有“取消”和“确定”按钮，可以点击周边消失)"},
                      @{@"title":@"带输入框提示"},
                      @{@"title":@"系统提示(中间)"},
                      @{@"title":@"系统提示(底部)"},
                      
                      
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
- (void)customAlterView1 {
    SFCustomAlterView *alterView = [SFCustomAlterView alterViewWithTitle:@"提示" content:@"确定放弃比赛资格吗？" sure:@"确定" sureBtClcik:^(NSString *str) {
        
    }];
    [alterView show];
}
- (void)customAlterView2 {
    SFCustomAlterView *alterView = [SFCustomAlterView alterViewWithTitle:@"提示" alterType:SFAlterTypeLabel content:@"确定放弃比赛资格吗？" cancel:@"取消" sure:@"确定" cancelBtClcik:^{
        
    } sureBtClcik:^(NSString *str) {
        
    }];
    [alterView show];
}
- (void)customAlterView3 {
    SFCustomAlterView *alterView = [SFCustomAlterView alterViewWithTitle:@"温馨提示" alterType:SFAlterTypeText content:@"请输入比赛名称" cancel:@"取消" sure:@"确定" cancelBtClcik:^{
        
    } sureBtClcik:^(NSString *str) {
        
    }];
    [alterView show];
}
- (void)customAlterView4 {
    SFCustomAlterView *alterView = [SFCustomAlterView alterViewNoLineWithTitle:@"提示" content:@"确定放弃比赛资格吗？" cancel:@"取消" sure:@"确定" cancelBtClcik:^{
        
    } sureBtClcik:^(NSString *str) {
        
    } CanCancel:YES];
    [alterView show];
}
- (void)customAlterView5 {
    [SFAlertController AlertViewWithTitle:@"提示" message:@"确定放弃比赛资格吗？" cancelTitle:@"取消" acitons:@[@"确定"] style:SFAlertViewAlert inView:self.view itemblock:^(NSInteger itemIndex) {
        if (itemIndex>0) {
            
        }
    }];
    
}
- (void)customAlterView6 {
    [SFAlertController AlertViewWithTitle:@"提示" message:@"请选择性别" cancelTitle:@"取消" acitons:@[@"男",@"女"] style:SFAlertViewSheet inView:self.view itemblock:^(NSInteger itemIndex) {
        if (itemIndex == 1) {
            NSLog(@"男");
        }else if (itemIndex == 2){
            NSLog(@"女");
        }
    }];
    
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
