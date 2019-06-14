//
//  UITableViewCellLayoutAttibutes.m
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "UITableViewCellLayoutAttributes.h"

@implementation UITableViewCellLayoutAttributes


+(instancetype)createCellAttributesWithData:(id)data
                                  className:(NSString *) className
                                 cellHeight:(CGFloat)cellHeight
                            cellHeightBlock:(CellHeightBlock)cellHeightBlock
                                actionBlock:(CellActionBlock) actionBlock
                               cellDelegate:(id)cellDelegate{
    UITableViewCellLayoutAttributes *cellAttr = [[self alloc]init];
    cellAttr.cellDelegate = cellDelegate;
    cellAttr.cellData = data;
    cellAttr.className = className;
    cellAttr.cellHeight = cellHeight;
    cellAttr.cellHeightBlock = cellHeightBlock;
    cellAttr.actionBlock = actionBlock;
    return cellAttr;
}

+(instancetype)createCellAttributesWithData:(id)data
                                  className:(NSString *)className
                                 cellHeight:(CGFloat)cellHeight{
    return [self createCellAttributesWithData:data className:className cellHeight:cellHeight cellHeightBlock:nil actionBlock:nil cellDelegate:nil];
}

+(instancetype)createCellAttributesWithData:(id)data
                                  className:(NSString *)className
                                 cellHeight:(CGFloat)cellHeight
                               cellDelegate:(id)delegate{
    return [self createCellAttributesWithData:data className:className cellHeight:cellHeight cellHeightBlock:nil actionBlock:nil cellDelegate:delegate];
}
@end
