//
//  LayoutAttributeCell.m
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "LayoutAttributeCollectionCell.h"

@implementation LayoutAttributeCollectionCell

@synthesize data = _data;


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
       
     
    }
    return self;
}

+ (instancetype)dequeueReusableCellWithCollectionView:(UICollectionView *)collectionView at:(NSIndexPath *)at {

    NSString *classString = NSStringFromClass(self);
    LayoutAttributeCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:classString forIndexPath:at];
    
    return cell ;
}

@end
