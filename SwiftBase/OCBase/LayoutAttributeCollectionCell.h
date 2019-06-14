//
//  LayoutAttributeCell.h
//  QuWangApp
//
//  Created by yangang on 15/8/6.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayoutAttributeCollectionCell : UICollectionViewCell{
    id _data;
   
}

@property(nonatomic,strong)id data;
@property(nonatomic, weak)id delegate;

+ (CGFloat)calculateHeightWithData:(id)data;


+ (instancetype)dequeueReusableCellWithCollectionView:(UICollectionView *)collectionView at:(NSIndexPath *)at;

@end
