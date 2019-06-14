//
//  LayoutAttributeCollectionView.m
//  kumu
//
//  Created by mac on 09/05/2018.
//  Copyright © 2018 hw. All rights reserved.
//

#import "LayoutAttributeCollectionView.h"
#import "UICollectionViewGroupLayoutAttributes.h"
#import "UICollectionViewCellLayoutAttributes.h"
#import "LayoutAttributeCollectionCell.h"
#import "LayoutCollectionSectionView.h"
#import "HeaderReusableView.h"
#import <objc/message.h>

@implementation LayoutAttributeCollectionView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
    
}
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
        
    }
    return self;
}


#pragma mark -UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSInteger totalSection = 0;
    if (self.layoutCollectionDelegate && [self.layoutCollectionDelegate respondsToSelector:@selector(sectionLayoutAttributesOfCollectionView:)]) {
        self.attributesArr =  [self.layoutCollectionDelegate sectionLayoutAttributesOfCollectionView:self];
        totalSection = [self.attributesArr count];
    }
    return totalSection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  ((UICollectionViewGroupLayoutAttributes *)self.attributesArr[section]).rows;
 
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UICollectionViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    UICollectionViewCellLayoutAttributes *cellAttributes = groupAttributes.cellLayoutAttributesArr[row];
    Class className = NSClassFromString(cellAttributes.className);
    Method method = class_getClassMethod([className class],@selector(dequeueReusableCellWithCollectionView:at:));
    
    LayoutAttributeCollectionCell *cell =  (LayoutAttributeCollectionCell *)((id(*)(id, SEL,id,id))objc_msgSend)([className class], method_getName(method),collectionView,indexPath);

    if (self.layoutCollectionDelegate && [self.layoutCollectionDelegate respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:cell:)]) {
        [self.layoutCollectionDelegate collectionView:collectionView cellForItemAtIndexPath:indexPath cell:cell];
    }
    if (cellAttributes.cellDelegate) {
        cell.delegate = cellAttributes.cellDelegate;
    }
    
    cell.data = cellAttributes.cellData;

  
    return cell;
    
}



-(CGFloat)heightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    UICollectionViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    return groupAttributes.sectionHeaderHeight;
    
}
-(CGFloat)heightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    UICollectionViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    return groupAttributes.sectionFooterHeight;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    if (kind == UICollectionElementKindSectionHeader) {
          UICollectionViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
        NSString *className =  groupAttributes.sectionHeaderClassName;
         HeaderReusableView *sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:className forIndexPath:indexPath];
        sectionView.sectionData = groupAttributes.sectionHeaderData;
        sectionView.delegate = groupAttributes.sectionHeaderDelegate;
        
        return sectionView;
    } else {
        UICollectionViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
        NSString *className =  groupAttributes.sectionFooterClassName;
        HeaderReusableView *sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:className forIndexPath:indexPath];
        sectionView.sectionData = groupAttributes.sectionFooterData;
        sectionView.delegate = groupAttributes.sectionFooterDelegate;
        return sectionView;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UICollectionViewGroupLayoutAttributes *groupAttributes = self.attributesArr[section];
    UICollectionViewCellLayoutAttributes *cellAttributes = groupAttributes.cellLayoutAttributesArr[row];
    if (cellAttributes.actionBlock) {
        cellAttributes.actionBlock();
    }
    
    if (self.layoutCollectionDelegate && [self.layoutCollectionDelegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {

        [self.layoutCollectionDelegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.layoutCollectionDelegate && [self.layoutCollectionDelegate respondsToSelector:@selector(collectionView:didEndDisplayingCell:forItemAtIndexPath:)]) {
       [self.layoutCollectionDelegate collectionView:self didEndDisplayingCell:cell forItemAtIndexPath:indexPath];
        
    }
}

@end
