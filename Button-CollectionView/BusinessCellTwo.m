//
//  BusinessCellTwo.m
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import "BusinessCellTwo.h"
#import "ActivityTwoModel.h"

typedef enum : NSUInteger {
    
    kNormal,
    kSelected,
    
} ESelectedState;

@interface BusinessCellTwo ()

@property (nonatomic, strong)UILabel *businessLabel;

@end

@implementation BusinessCellTwo

- (void)setUpCell {
    
    self.layer.borderWidth  = 0.5;
    self.layer.cornerRadius = 12;
    
}

- (void)buildUpSubviews {
    
    self.businessLabel               = [[UILabel alloc] initWithFrame:self.bounds];
    self.businessLabel.textColor     = [UIColor grayColor];
    self.businessLabel.textAlignment = NSTextAlignmentCenter;
    self.businessLabel.font          = [UIFont systemFontOfSize:14];
    [self addSubview:self.businessLabel];
    
}

- (void)loadContent {
    
    ActivityTwoModel *model = self.data;
    
    self.businessLabel.text = model.typeName;
    
    if (model.isSelected) {
        
        [self changToState:kSelected animation:NO];
        
    } else {
    
        [self changToState:kNormal animation:NO];
    
    }
}

- (void)changToState:(ESelectedState)state animation:(BOOL)animation {
    
    if (state == kNormal) {
        
        self.businessLabel.textColor = [UIColor grayColor];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
    } else if (state == kSelected) {
        
        self.businessLabel.textColor = [UIColor blueColor];
        self.layer.borderColor = [UIColor blueColor].CGColor;
    }
    
}


- (void)touchEvent {
    
    ActivityTwoModel *model = self.data;
    
    if (model.isSelected == YES) {
        
        model.isSelected = NO;
        [self changToState:kNormal animation:NO];
        
    } else if (model.isSelected == NO) {
    
        model.isSelected = YES;
        [self changToState:kSelected animation:NO];
    }
    
}


@end
