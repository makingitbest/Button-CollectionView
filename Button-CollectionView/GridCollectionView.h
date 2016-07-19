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

- (void)gridCollectionView:(GridCollectionView *)gridCollectionView didSelected:(CustomCollectionViewCell *)cell;

@end

@interface GridCollectionView : UIView

@property (nonatomic, weak) id <GridCollectionViewDelegate> delegate;

@property (nonatomic) UIEdgeInsets    contentInsets;
@property (nonatomic) CGFloat         verticalGap;   // 垂直
@property (nonatomic) CGFloat         HorizontalGap; // 水平
@property (nonatomic) CGFloat         cellHeight;    // cell的高度
@property (nonatomic) NSInteger       HorizontalCellCount; // 水平的cell的个数
@property (nonatomic, strong) NSArray <id>  *dataArray;
@property (nonatomic, strong) TypeCellClass *registCell;

- (void)setUpFrame;

- (void)LoadData;

@end
