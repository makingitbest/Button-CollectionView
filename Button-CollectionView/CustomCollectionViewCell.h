//
//  CustomCollectionViewCell.h
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) id           data;
@property (nonatomic, strong) NSIndexPath *indexPath;

- (void)setUpCell;

- (void)buildUpSubviews;

- (void)loadContent;

- (void)touchEvent;

@end
