//
//  MineOpinionImgCollCell.h
//  JMX
//
//  Created by 今日 on 2018/9/25.
//  Copyright © 2018年 daocao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineOpinionImgCollCell : UICollectionViewCell

-(void)update:(NSIndexPath *)index imgArr:(NSMutableArray *)imgArr chooseArr:(NSMutableArray *)chooseArr num:(NSInteger)num;
@property (nonatomic,copy)void(^updateUIBlock)(NSMutableArray *arr,NSMutableArray *chooseArr);

@end
