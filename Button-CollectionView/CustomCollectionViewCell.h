//
//  CustomCollectionViewCell.h
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

/**
 *  数据
 */
@property (nonatomic, strong) id           data;

/**
 *  indexPath
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 * 设置cell的基本属性
 */
- (void)setUpCell;

/**
 *  控件的添加
 */
- (void)buildUpSubviews;

/**
 *  加载数据
 */
- (void)loadContent;

/**
 *  点击事件
 */
- (void)touchEvent;

@end
