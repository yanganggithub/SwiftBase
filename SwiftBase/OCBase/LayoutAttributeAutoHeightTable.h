//
//  LayoutAttributeAutoHeightTable.h
//  IOSPala
//
//  Created by yangang on 2017/11/6.
//  Copyright © 2017年 yangang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutTableDelegate.h"



@interface LayoutAttributeAutoHeightTable : UITableView<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,weak)id<LayoutTableDelegate> layoutTableDelegate;
@property(nonatomic,strong)NSArray *attributesArr;


@end
