//
//  UITableViewCellLayoutAttibutes.h
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutAttributeModel.h"



typedef void(^CollectionCellActionBlock) ();
typedef CGFloat(^CellHeightBlock) (UITableView * tableView,NSIndexPath * indexPath);
typedef LayoutAttributeModel* (^CalculateLayoutModelBlock) (LayoutAttributeModel * model);
@interface UICollectionViewCellLayoutAttributes : NSObject

@property(nonatomic,strong)id cellData;
@property(nonatomic,copy)NSString *className;
@property(nonatomic,assign)CGFloat cellOriginX;
@property(nonatomic,assign)CGFloat cellWidth;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,copy)CellHeightBlock cellHeightBlock;
@property(nonatomic,copy)CalculateLayoutModelBlock layoutModelBlock;
@property(nonatomic,copy)CollectionCellActionBlock actionBlock;
@property(nonatomic, weak)id cellDelegate;




+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *) className
                                          cellOriginX:(CGFloat)originX
                                        cellWidth:(CGFloat)cellWidth
                                           cellHeight:(CGFloat)cellHeight
                                     layoutModelBlock:(CalculateLayoutModelBlock)layoutModelBlock
                                          actionBlock:(CollectionCellActionBlock) actionBlock
                                         cellDelegate:(id)cellDelegate;

+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *) className
                                     layoutModelBlock:(CalculateLayoutModelBlock)layoutModelBlock
                                          actionBlock:(CollectionCellActionBlock) actionBlock
                                         cellDelegate:(id)cellDelegate;

+(instancetype)createCollectionCellAttributesWithData:(id)data
                                  className:(NSString *)className
                                           cellHeight:(CGFloat)cellHeight;

+(instancetype)createCollectionCellAttributesWithData:(id)data
                                            className:(NSString *)className
                                           cellHeight:(CGFloat)cellHeight
                                         cellDelegate:(id)cellDelegate;


@end
