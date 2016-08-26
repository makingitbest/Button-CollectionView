//
//  GridCollectionView.h
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionViewCell.h"
#import "TypeCellClass.h"

@class GridCollectionView;

@protocol GridCollectionViewDelegate <NSObject>

/**
 *  代理方法
 *
 *  @param gridCollectionView gridCollectionView
 *  @param cell               cell
 */
- (void)gridCollectionView:(GridCollectionView *)gridCollectionView didSelected:(CustomCollectionViewCell *)cell;

@end

@interface GridCollectionView : UIView

@property (nonatomic, weak) id <GridCollectionViewDelegate> delegate;

/**
 *  距离上,左,下,右的距离
 */
@property (nonatomic) UIEdgeInsets    contentInsets;

/**
 *  控件之间的--垂直Gap
 */
@property (nonatomic) CGFloat         verticalGap;

/**
 *  控件之间的--水平Gap
 */
@property (nonatomic) CGFloat         HorizontalGap;

/**
 *  每个控件的高度
 */
@property (nonatomic) CGFloat         cellHeight;

/**
 *  水平摆放控件的个数
 */
@property (nonatomic) NSInteger       HorizontalCellCount;

/**
 *  数据源
 */
@property (nonatomic, strong) NSArray <id>  *dataArray;

/**
 *  注册cell的类型
 */
@property (nonatomic, strong) TypeCellClass *registCell;

/**
 *  动态设置frame
 */
- (void)setUpFrame;

/**
 *  加载数据
 */
- (void)LoadData;

@end
