//
//  LayoutAttributeModel.h
//  kumu
//
//  Created by mac on 2018/12/18.
//  Copyright © 2018年 hw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LayoutAttributeModel : NSObject

@property(nonatomic,assign) CGFloat nextPointY;
@property(nonatomic,assign) CGRect  layoutFrame;
@property(nonatomic,assign) CGFloat computeY;


@end


