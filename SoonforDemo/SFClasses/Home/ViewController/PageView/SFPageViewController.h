//
//  SFPageViewController.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/11.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFPageViewController : SFBaseViewController
@property (nonatomic, strong) NSMutableArray *titleData;
@property (nonatomic, strong) WMPageController *pageVC;
@property (nonatomic, assign) NSInteger styleIndex;
@end
