//
//  LayoutAttributeCell.h
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayoutAttributeCell : UITableViewCell{
    id _data;
    id _computedData;
}

@property(nonatomic,strong)id data;
@property(nonatomic, weak)id delegate;
@property(nonatomic,strong)id computedData;

+ (CGFloat)calculateHeightWithData:(id)data;
+(instancetype)dequeueReusableCellWithTableView:(UITableView *)tableView;

@end
