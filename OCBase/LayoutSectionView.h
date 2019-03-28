//
//  LayoutSectionView.h
//  QuWangApp
//
//  Created by yangang on 15/8/26.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayoutSectionView : UITableViewHeaderFooterView{
    id _sectionData;
}

@property(nonatomic,strong)id sectionData;
@property(nonatomic, weak)id delegate;
@end
