//
//  GridCollectionView.m
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import "GridCollectionView.h"

@interface GridCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView           *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation GridCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        self.collectionView                 = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.delegate        = self;
        self.collectionView.dataSource      = self;
        [self addSubview:self.collectionView];
    }
    
    return self;
}

- (void)setUpFrame {

    self.flowLayout.minimumLineSpacing      = self.verticalGap; // 行间距
    self.flowLayout.minimumInteritemSpacing = self.HorizontalGap; // 列间距
    
    self.collectionView.contentInset = self.contentInsets;
    
    CGFloat cellWidth = (self.bounds.size.width - self.contentInsets.left - self.contentInsets.right - (self.HorizontalCellCount - 1) * self.HorizontalGap)/self.HorizontalCellCount;
    
    self.flowLayout.itemSize = CGSizeMake(cellWidth, self.cellHeight);
    
    NSInteger count = 0;
    
    self.dataArray.count % self.HorizontalCellCount == 0 ? (count = self.dataArray.count / self.HorizontalCellCount) : (count = self.dataArray.count / self.HorizontalCellCount + 1);
    
    CGFloat height = self.contentInsets.top + self.contentInsets.bottom + self.verticalGap * (count - 1) + self.cellHeight * count ;

    self.collectionView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, height);
    
    [self.collectionView registerClass:self.registCell.className forCellWithReuseIdentifier:self.registCell.registID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.registCell.registID forIndexPath:indexPath];
    cell.data                      = self.dataArray[indexPath.row];
    cell.indexPath                 = indexPath;
    cell.layer.borderWidth         = 0.5;
    [cell loadContent];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCollectionViewCell *cell = (id)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell touchEvent];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(gridCollectionView:didSelected:)]) {
        
        [self.delegate gridCollectionView:self didSelected:cell];
    }
}

- (void)LoadData{

    [self.collectionView reloadData];
}

@end
