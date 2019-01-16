//
//  SFPageStyleViewController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/12.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFPageStyleViewController.h"
#import "SFPageViewController.h"
#import "SFMenuBarVC.h"

@interface SFPageStyleViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;


@end

@implementation SFPageStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PageView";
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
    if (SFStringEqual(name, @"不带下划线")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"带下划线")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"下方三角形")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"椭圆填充框")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"椭圆空心框")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"带外框+椭圆填充框")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"菜单栏左右带按钮")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (SFStringEqual(name, @"菜单栏在导航上")) {
        SFPageViewController *vc = [[SFPageViewController alloc]init];
        vc.titleData = [NSMutableArray arrayWithObjects:@"热门",@"客厅",@"儿童房",@"书房",@"厨房",@"卫浴",@"阳台",@"其他" , nil];
        vc.styleIndex = indexPath.row;
        [self presentViewController:vc animated:YES completion:nil];
    }else if (SFStringEqual(name, @"自定义菜单栏")) {
        SFMenuBarVC *vc = [[SFMenuBarVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [NSMutableArray arrayWithObjects:
                      @{@"title":@"不带下划线"},
                      @{@"title":@"带下划线"},
                      @{@"title":@"下方三角形"},
                      @{@"title":@"椭圆填充框"},
                      @{@"title":@"椭圆空心框"},
                      @{@"title":@"带外框+椭圆填充框"},
                      @{@"title":@"菜单栏左右带按钮"},
                      @{@"title":@"菜单栏在导航上"},
                      @{@"title":@"自定义菜单栏"},
                      
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
