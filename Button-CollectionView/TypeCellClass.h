//
//  TypeCellClass.h
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TypeCellClass : NSObject

/**
 *  cell的className
 */
@property (nonatomic, strong)Class     className;

/**
 *  cell的注册ID
 */
@property (nonatomic, strong)NSString *registID;

@end
