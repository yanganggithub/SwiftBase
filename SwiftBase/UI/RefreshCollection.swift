//
//  RefreshCollection.swift
//  tinman
//
//  Created by crow on 2018/11/6.
//  Copyright © 2018年 xhy. All rights reserved.
//

import UIKit
import MJRefresh
//内部代码和RefreshTable完全一样，暂时没找到好的方法把这两个合并为一个
class RefreshCollection: UICollectionView {

    fileprivate let pageIndexKey = "page"
    fileprivate let pageSizeKey = "page_size"
    fileprivate var startPage = 1   //和接口约定的开始的页码，通常来说为0和1，不表示当前请求的页码
    fileprivate var currentPage = 0    //当前显示的页码，请求过程中不改变它的值，请求成功后再设置它的值
    var pageSize = 20
    
    var requestPageParams: [String: Any]?  //当前请求过程中的参数，请求成功后根据pageParams设置currentPage的值
    var noDataView: UIView?
    func noDataLabel(text: String = "No Data") -> UILabel {
        let label = UILabel()
        label.text = text
        label.isHidden = true
        label.textColor = UIColor.init(r: 170, g: 170, b: 170)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        self.addSubview(label)
        label.frame = CGRect(x: 0, y: (self.viewHeight - 30)/2 - 50, width: UIScreen.main.bounds.size.width, height: 30)
        return label
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if let noDataView = noDataView {
            noDataView.viewTop = (self.viewHeight - noDataView.viewHeight)/2 - 50
        }
    }
    func setRefreshBlock(_ block: @escaping ([String: Any]) -> Void, withFooter: Bool) {
        self.currentPage = startPage
        self.mj_header = RefreshHeader.headerWithBlock {
            [weak self] in
            if let strongSelf = self {
                strongSelf.requestPageParams = [strongSelf.pageIndexKey: strongSelf.startPage, strongSelf.pageSizeKey: strongSelf.pageSize]
                block(strongSelf.requestPageParams!)
            }
        }
      
     
       
        if withFooter {
            self.mj_footer = RefreshFooter.footerWithBlock {
                [weak self] in
                if let strongSelf = self {
                    strongSelf.requestPageParams = [strongSelf.pageIndexKey: strongSelf.currentPage + 1, strongSelf.pageSizeKey: strongSelf.pageSize]
                    block(strongSelf.requestPageParams!)
                }
            }
            self.mj_footer.isHidden = true
        }
    }
    func updateArray<T>(_ oldArray: inout [T], newArray: [T]) {
        if let params = self.requestPageParams, let page = params[pageIndexKey] as? Int {
            currentPage = page
            if page == startPage {
                oldArray.removeAll()
            }
            oldArray.append(contentsOf: newArray)
            if let mj_footer = self.mj_footer {
                if newArray.count < pageSize {
                    mj_footer.isHidden = true
                } else {
                    mj_footer.isHidden = false
                }
            }
            if let noDataView = noDataView {
                if oldArray.count == 0 {
                    noDataView.isHidden = false
                } else {
                    noDataView.isHidden = true
                }
            }
        }
    }
    func stopRefresh() {
        self.mj_header.endRefreshing()
        if let mj_footer = self.mj_footer {
            mj_footer.endRefreshing()
        }
    }
    func headerRefresh() {
        self.mj_header.beginRefreshing()
    }

}
