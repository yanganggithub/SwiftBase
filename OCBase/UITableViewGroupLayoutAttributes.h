//
//  UITableViewGroupLayoutAttributes.h
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITableViewGroupLayoutAttributes : NSObject

@property(nonatomic,copy)NSString *sectionHeaderClassName;
@property(nonatomic,copy) NSString *sectionFooterClassName;
@property(nonatomic,assign)CGFloat sectionHeaderHeight;
@property(nonatomic,assign)CGFloat sectionFooterHeight;
@property(nonatomic,strong)NSMutableArray *cellLayoutAttributesArr;
@property(nonatomic,assign)NSInteger rows;     //更改数据源的时候必须更改
@property(nonatomic,assign)NSInteger groupIndex;
@property(nonatomic,strong)id sectionHeaderData;
@property(nonatomic,strong)id sectionFooterData;
@property(nonatomic,weak)id sectionHeaderDelegate;
@property(nonatomic,weak)id sectionFooterDelegate;

+(instancetype)createGroupLayoutWithSectionArr:(NSMutableArray *)cellLayoutAttributesArr
                                          rows:(NSInteger)rows
                           sectionHeaderHeight:(CGFloat)sectionHeaderHeight
                        sectionHeaderClassName:(NSString *)sectionHeaderClassName
                             sectionHeaderData:(id)sectionHeaderData
                         sectionHeaderDelegate:(id)sectionHeaderDelegate
                           sectionFooterHeight:(CGFloat)sectionFooterHeight
                        sectionFooterClassName:(NSString *)sectionFooterClassName
                             sectionFooterData:(id)sectionFooterData
                         sectionFooterDelegate:(id)sectionFooterDelegate;

+(instancetype)createGroupLayoutWithSectionArr:(NSMutableArray *)cellLayoutAttributesArr
                                          rows:(NSInteger)rows;




@end
