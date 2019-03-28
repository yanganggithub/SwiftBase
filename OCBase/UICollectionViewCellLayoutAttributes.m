//
//  UITableViewCellLayoutAttibutes.m
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "UICollectionViewCellLayoutAttributes.h"

@implementation UICollectionViewCellLayoutAttributes


+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *) className
                                          cellOriginX:(CGFloat)originX
                                            cellWidth:(CGFloat)cellWidth
                                           cellHeight:(CGFloat)cellHeight
                                     layoutModelBlock:(CalculateLayoutModelBlock)layoutModelBlock
                                          actionBlock:(CollectionCellActionBlock) actionBlock
                                         cellDelegate:(id)cellDelegate{
    
    UICollectionViewCellLayoutAttributes *cellAttr = [[self alloc]init];
    cellAttr.cellData = data;
    cellAttr.className = className;
    cellAttr.cellOriginX = originX;
    cellAttr.cellWidth = cellWidth;
    cellAttr.cellHeight = cellHeight;
    cellAttr.layoutModelBlock = layoutModelBlock;
    cellAttr.actionBlock= actionBlock;
    cellAttr.cellDelegate = cellDelegate;
    return cellAttr;
    
    
}

+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *) className
                                     layoutModelBlock:(CalculateLayoutModelBlock)layoutModelBlock
                                          actionBlock:(CollectionCellActionBlock) actionBlock
                                         cellDelegate:(id)cellDelegate{
 return [self createCollectionCellAttributesWithData:data className:className cellOriginX:0 cellWidth:0 cellHeight:0 layoutModelBlock:layoutModelBlock actionBlock:actionBlock cellDelegate:cellDelegate];
}


+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *)className
                                           cellHeight:(CGFloat)cellHeight{
    return [self createCollectionCellAttributesWithData:data className:className cellOriginX:0 cellWidth:[UIScreen mainScreen].bounds.size.width cellHeight:cellHeight layoutModelBlock:nil actionBlock:nil cellDelegate:nil];
}

+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *)className
                                           cellHeight:(CGFloat)cellHeight
                                         cellDelegate:(id)cellDelegate{
    return [self createCollectionCellAttributesWithData:data className:className cellOriginX:0 cellWidth:[UIScreen mainScreen].bounds.size.width cellHeight:cellHeight layoutModelBlock:nil actionBlock:nil cellDelegate:cellDelegate];
}
@end
