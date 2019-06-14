//
//  HeaderReusableView.h
//  UICollectionViewLayout
//
//  Created by lujh on 2017/5/16.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderReusableView : UICollectionReusableView{
       id _sectionData;
}

@property(nonatomic,strong)id sectionData;
@property(nonatomic, weak)id delegate;

@end
