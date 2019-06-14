//
//  LayoutAttributeCollectionView.h
//  kumu
//
//  Created by mac on 09/05/2018.
//  Copyright © 2018 hw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UICollectionViewGroupLayoutAttributes;

@protocol LayoutCollectionViewDelegate <NSObject>

- (NSArray *)sectionLayoutAttributesOfCollectionView:(UICollectionView *)table;  //获得数据源

@optional
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath cell:(UICollectionViewCell *)cell;


@end

@interface LayoutAttributeCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak)id<LayoutCollectionViewDelegate> layoutCollectionDelegate;
@property(nonatomic,strong)NSMutableArray *attributesArr;



@end
