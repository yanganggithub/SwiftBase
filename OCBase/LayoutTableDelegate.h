//
//  LayoutTableDelegate.h
//  shop
//
//  Created by mac on 2019/1/31.
//  Copyright © 2019年 hw. All rights reserved.
//

@protocol LayoutTableDelegate <NSObject>

- (NSArray *)sectionLayoutAttributesOfTableView:(UITableView *)table;  //获得数据元

@optional
- (void)refreshTable:(UITableView *)table;   //刷新列表
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath; //选中cell
- (void)loadMore:(UITableView *)table;  //加载更多

- (BOOL)shouldCheckLoad;


- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath cell:(UITableViewCell *)cell;

@end
