//
//  ViewController.m
//  Button-CollectionView
//
//  Created by WangQiao on 16/7/19.
//  Copyright © 2016年 wq. All rights reserved.
//

#import "ViewController.h"
#import "GridCollectionView.h"
#import "CustomCollectionViewCell.h"
#import "TypeCellClass.h"
#import "ActivityModel.h"
#import "BusinessCell.h"
#import "BusinessCellTwo.h"
#import "ActivityTwoModel.h"
#import "UIView+SetRect.h"

typedef enum : NSUInteger {
    
    kBusinessOne = 20,
    kBusinessTwo,
    
} EBusinessTag;

@interface ViewController () <GridCollectionViewDelegate>

@property (nonatomic, strong) UIScrollView       *scrollView;

@property (nonatomic, strong) UIView             *backOneView;
@property (nonatomic, strong) UIView             *backTwoView;

@property (nonatomic, strong) GridCollectionView *gridOneView;
@property (nonatomic, strong) GridCollectionView *gridTwoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.scrollView  = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    {
        self.backOneView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        self.backOneView.backgroundColor = [UIColor grayColor];
        [self.scrollView addSubview:self.backOneView];
        
        UILabel *label      = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width - 15, 40)];
        label.text          = @"所属行业";
        label.textColor     = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font          = [UIFont boldSystemFontOfSize:16];
        [self.backOneView addSubview:label];
        
        NSMutableArray *mulArray = [[NSMutableArray alloc] init];
        NSArray        *array    = @[@"全部", @"物流运输", @"体育运动", @"工具软件", @"电子商务",
                                     @"社交网络", @"企业服务", @"文化娱乐",@"硬件", @"广告营销",
                                     @"游戏", @"本地生活",@"旅游", @"医疗", @"房产", @"汽车交通",
                                     @"金融", @"教育", @"其他"];
        
        for (NSString *string in array) {
            
            ActivityModel *model = [[ActivityModel alloc] init];
            model.typeName       = string;
            [mulArray addObject:model];
        }
        
        self.gridOneView   = [[GridCollectionView alloc] initWithFrame: CGRectMake(0, self.backOneView.bottom, self.view.frame.size.width, 400)];
        self.gridOneView.contentInsets       = UIEdgeInsetsMake(15, 15, 15, 15);
        self.gridOneView.HorizontalGap       = 15;
        self.gridOneView.verticalGap         = 15;
        self.gridOneView.cellHeight          = 35;
        self.gridOneView.HorizontalCellCount = 3;
        self.gridOneView.dataArray           = mulArray;
        self.gridOneView.tag                 = kBusinessOne;
        
        TypeCellClass *typeCell = [[TypeCellClass alloc] init];
        typeCell.className      = [BusinessCell class];
        typeCell.registID       = @"BusinessCell";
        
        self.gridOneView.registCell = typeCell;
        self.gridOneView.delegate   = self;
        [self.gridOneView setUpFrame];
        [self.scrollView addSubview:self.gridOneView];
    }
    
    {
        self.backTwoView                 = [[UIView alloc] initWithFrame:CGRectMake(0, self.gridOneView.bottom, self.view.frame.size.width, 40)];
        self.backTwoView.backgroundColor = [UIColor grayColor];
        [self.scrollView addSubview:self.backTwoView];
        
        UILabel *label      = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width - 15, 40)];
        label.text          = @"所属行业";
        label.textColor     = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font          = [UIFont boldSystemFontOfSize:16];
        [self.backTwoView addSubview:label];
        
        NSMutableArray *mulARR = [NSMutableArray array];
        NSArray *array = @[@"物流运输", @"体育运动", @"工具软件", @"电子商务", @"社交网络",
                           @"企业服务", @"文化娱乐",@"硬件", @"广告营销", @"游戏", @"本地生活",
                           @"旅游", @"医疗", @"房产", @"汽车交通",@"金融", @"教育"];
        
        for (NSString *string in array) {
            
            ActivityTwoModel *model = [[ActivityTwoModel  alloc] init];
            model.typeName          = string;
            [mulARR addObject:model];
        }
        
        self.gridTwoView                     = [[GridCollectionView alloc] initWithFrame:CGRectMake(0, self.backTwoView.bottom, self.view.width, 400)];
        self.gridTwoView.HorizontalGap       = 15;
        self.gridTwoView.verticalGap         = 10;
        self.gridTwoView.cellHeight          = 25;
        self.gridTwoView.contentInsets       = UIEdgeInsetsMake(7, 4, 7, 4);
        self.gridTwoView.HorizontalCellCount = 4;
        self.gridTwoView.dataArray           = mulARR;
        self.gridTwoView.tag                 = kBusinessTwo;
        
        TypeCellClass *typeCell = [[TypeCellClass alloc] init];
        typeCell.className      = [BusinessCellTwo class];
        typeCell.registID       = @"BusinessCellTwo";
        
        self.gridTwoView.registCell = typeCell;
        self.gridTwoView.delegate   = self;
        [self.gridTwoView setUpFrame];
        [self.scrollView addSubview:self.gridTwoView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.gridTwoView.bottom);
}

- (void)gridCollectionView:(GridCollectionView *)gridCollectionView didSelected:(CustomCollectionViewCell *)cell {
    
    if (gridCollectionView.tag == kBusinessOne) {
        
        [gridCollectionView.dataArray enumerateObjectsUsingBlock:^(ActivityModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
            
            cell.indexPath.row == idx ? (model.isSelected = YES):(model.isSelected = NO);
        }];
        
        [gridCollectionView LoadData];
        
    } else if ( gridCollectionView.tag == kBusinessTwo) {
        
        
    }
}

@end
