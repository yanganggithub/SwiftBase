//
//  LayoutAttributeTableView.h
//  QuWangApp
//
//  Created by yangang on 15/8/19.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCellLayoutAttributes.h"
#import "UITableViewGroupLayoutAttributes.h"
#import "LayoutTableDelegate.h"


typedef enum RefreshType{
    RefreshTypeHeader,
    RefreshTypeFooter
}RefreshType;



@interface LayoutAttributeTableView : UITableView<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,weak)id<LayoutTableDelegate> layoutTableDelegate;
@property(nonatomic,strong)NSArray *attributesArr;

@end
