//
//  UITableViewGroupLayoutAttributes.m
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "UICollectionViewGroupLayoutAttributes.h"

@implementation UICollectionViewGroupLayoutAttributes

+(instancetype)createCollectionGroupLayoutWithSectionArr:(NSMutableArray *)cellLayoutAttributesArr
                                                    rows:(NSInteger)rows
                                     sectionHeaderHeight:(CGFloat)sectionHeaderHeight
                                  sectionHeaderClassName:(NSString *)sectionHeaderClassName
                                       sectionHeaderData:(id)sectionHeaderData
                                   sectionHeaderDelegate:(id)sectionHeaderDelegate
                                     sectionFooterHeight:(CGFloat)sectionFooterHeight
                                  sectionFooterClassName:(NSString *)sectionFooterClassName
                                       sectionFooterData:(id)sectionFooterData
                                   sectionFooterDelegate:(id)sectionFooterDelegate{
    UICollectionViewGroupLayoutAttributes *group = [[self alloc]init];
    group.cellLayoutAttributesArr = cellLayoutAttributesArr;
    group.rows = rows;
    group.sectionHeaderHeight = sectionHeaderHeight;
    group.sectionHeaderClassName = sectionHeaderClassName;
    group.sectionHeaderData = sectionHeaderData;
    group.sectionHeaderDelegate = sectionHeaderDelegate;
    group.sectionFooterHeight = sectionFooterHeight;
    group.sectionFooterClassName = sectionFooterClassName;
    group.sectionFooterData = sectionFooterData;
    group.sectionFooterDelegate = sectionFooterDelegate;
    group.groupIndex = 1;
    return group;
}

+(instancetype)createCollectionGroupLayoutWithSectionArr:(NSMutableArray *)cellLayoutAttributesArr
                                          rows:(NSInteger)rows{
        return [self createCollectionGroupLayoutWithSectionArr:cellLayoutAttributesArr rows:rows sectionHeaderHeight:0 sectionHeaderClassName:nil sectionHeaderData:nil sectionHeaderDelegate:nil sectionFooterHeight:0 sectionFooterClassName:nil sectionFooterData:nil sectionFooterDelegate:nil];
}
@end
