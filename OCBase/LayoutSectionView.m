//
//  LayoutSectionView.m
//  QuWangApp
//
//  Created by yangang on 15/8/26.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "LayoutSectionView.h"

@implementation LayoutSectionView


@synthesize sectionData = _sectionData;

+(instancetype) dequeueReusableSectionViewWithTableView : (UITableView *) tableView {
    
    NSString *classString = NSStringFromClass(self);
    LayoutSectionView * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:classString];
    
    return cell;
    
}

@end
