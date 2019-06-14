//
//  LayoutAttributeCell.m
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "LayoutAttributeCell.h"
#import <Masonry/Masonry.h>
@implementation LayoutAttributeCell

@synthesize data = _data;
@synthesize computedData = _computedData;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

+(instancetype)dequeueReusableCellWithTableView:(UITableView *)tableView{
    NSString *classString = NSStringFromClass(self);
    LayoutAttributeCell * cell = [tableView dequeueReusableCellWithIdentifier:classString];
    return cell;
}

@end
