//
//  LayoutAttributeTableView.m
//  QuWangApp
//
//  Created by yangang on 15/8/19.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "LayoutAttributeTableView.h"
#import "UITableViewGroupLayoutAttributes.h"
#import "UITableViewCellLayoutAttributes.h"
#import "LayoutAttributeCell.h"
#import "LayoutSectionView.h"
#import <objc/message.h>

@implementation LayoutAttributeTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.sectionHeaderHeight = 0;
        self.sectionFooterHeight = 0;
        self.showsVerticalScrollIndicator = NO;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        self.delegate = self;
        self.dataSource = self;
        self.sectionHeaderHeight = 0;
        self.sectionFooterHeight = 0;
        self.showsVerticalScrollIndicator = NO;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
 
    }
    return self;
    
}

-(void)loadInterface{
    [self reloadData];
    
}

#pragma mark - UIScrollDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    if (self.layoutTableDelegate &&
        [self.layoutTableDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
        [self.layoutTableDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.layoutTableDelegate &&
        [self.layoutTableDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        [self.layoutTableDelegate scrollViewDidEndDecelerating:scrollView];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.layoutTableDelegate &&
        [self.layoutTableDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.layoutTableDelegate scrollViewDidScroll:scrollView];
    }
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    UITableViewCellLayoutAttributes *cellAttributes = groupAttributes.cellLayoutAttributesArr[row];
    if (cellAttributes.cellHeightBlock) {
        cellAttributes.cellHeight = cellAttributes.cellHeightBlock(tableView,indexPath);
    }
    return cellAttributes.cellHeight;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    
    UITableViewCellLayoutAttributes *cellAttributes = groupAttributes.cellLayoutAttributesArr[row];
    if (cellAttributes.actionBlock) {
        cellAttributes.actionBlock();
    }
    
    if (self.layoutTableDelegate && [self.layoutTableDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.layoutTableDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    return groupAttributes.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    return groupAttributes.sectionFooterHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    Class className = NSClassFromString(groupAttributes.sectionHeaderClassName);
    Method method = class_getClassMethod([className class],@selector(dequeueReusableSectionViewWithTableView:));
    LayoutSectionView *sectionView =  (LayoutSectionView *)((id(*)(id, SEL,id))objc_msgSend)([className class], method_getName(method),tableView);
    sectionView.sectionData = groupAttributes.sectionHeaderData;
    sectionView.delegate = groupAttributes.sectionHeaderDelegate;

    return sectionView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    Class className = NSClassFromString(groupAttributes.sectionFooterClassName);
    Method method = class_getClassMethod([className class],@selector(dequeueReusableSectionViewWithTableView:));
    LayoutSectionView *sectionView =  (LayoutSectionView *)((id(*)(id, SEL,id))objc_msgSend)([className class], method_getName(method),tableView);
    sectionView.sectionData = groupAttributes.sectionFooterData;
    sectionView.delegate = groupAttributes.sectionFooterDelegate;
    return sectionView;
}



-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.layoutTableDelegate && [self.layoutTableDelegate respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)]) {
        [self.layoutTableDelegate tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger totalSection = 0;
    if (self.layoutTableDelegate && [self.layoutTableDelegate respondsToSelector:@selector(sectionLayoutAttributesOfTableView:)]) {
        self.attributesArr =  [self.layoutTableDelegate sectionLayoutAttributesOfTableView:self];
        totalSection = [self.attributesArr count];
    }
    return totalSection;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  ((UITableViewGroupLayoutAttributes *)self.attributesArr[section]).rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UITableViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    UITableViewCellLayoutAttributes *cellAttributes = groupAttributes.cellLayoutAttributesArr[row];
    Class className = NSClassFromString(cellAttributes.className);
    Method method = class_getClassMethod([className class],@selector(dequeueReusableCellWithTableView:));
    
    LayoutAttributeCell *cell =  (LayoutAttributeCell *)((id(*)(id, SEL,id))objc_msgSend)([className class], method_getName(method),tableView);
    
    if (cellAttributes.cellDelegate) {
        cell.delegate = cellAttributes.cellDelegate;
    }
    cell.data = cellAttributes.cellData;
    
    
    if (self.layoutTableDelegate && [self.layoutTableDelegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:cell:)]) {
        [self.layoutTableDelegate tableView:tableView cellForRowAtIndexPath:indexPath cell:cell];
    }

    return cell;
}

-(void)dealloc{
    self.delegate = nil;
    self.dataSource = nil;
}

@end
