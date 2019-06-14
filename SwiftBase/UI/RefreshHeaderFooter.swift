//
//  RefreshHeaderFooter.swift
//  Footy
//
//  Created by crow on 2018/6/1.
//  Copyright © 2018年 小厚鱼. All rights reserved.
//

import Foundation
import MJRefresh


class RefreshHeader: MJRefreshNormalHeader {
    static func headerWithBlock(_ block: @escaping MJRefreshComponentRefreshingBlock) -> RefreshHeader? {
        let header = RefreshHeader(refreshingBlock: block)
        header?.lastUpdatedTimeLabel.isHidden = true
        return header
    }
}
class RefreshFooter: MJRefreshAutoNormalFooter {
    static func footerWithBlock(_ block: @escaping MJRefreshComponentRefreshingBlock) -> RefreshFooter? {
        let footer = RefreshFooter(refreshingBlock: block)
        return footer
    }
}
