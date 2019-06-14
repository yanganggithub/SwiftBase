//
//  UITableViewCellLayoutAttibutes.h
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CellActionBlock) (void);
typedef CGFloat(^CellHeightBlock) (UITableView * tableView,NSIndexPath * indexPath);

@interface UITableViewCellLayoutAttributes : NSObject

@property(nonatomic,assign)BOOL frameLayout;
@property(nonatomic,strong)id cellData;
@property(nonatomic,copy)NSString *className;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,copy)CellHeightBlock cellHeightBlock;
@property(nonatomic,copy)CellActionBlock actionBlock;
@property(nonatomic, weak)id cellDelegate;

+(instancetype)createCellAttributesWithData:(id)data
                                  className:(NSString *) className
                                 cellHeight:(CGFloat)cellHeight
                            cellHeightBlock:(CellHeightBlock)cellHeightBlock
                                actionBlock:(CellActionBlock) actionBlock
                               cellDelegate:(id)cellDelegate;

+(instancetype)createCellAttributesWithData:(id)data
                                  className:(NSString *)className
                                 cellHeight:(CGFloat)cellHeight;

+(instancetype)createCellAttributesWithData:(id)data
                                  className:(NSString *)className
                                 cellHeight:(CGFloat)cellHeight
                               cellDelegate:(id)delegate;


@end
