//
//  CollectionHeaderView.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    // MARK:- 控件属性
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var moreBtn: UIButton!

    // MARK:- 定义模型属性
    var group : AnchorGroupModel? {
        didSet {
             titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
    
}

// MARK:- 快速创建方法
extension CollectionHeaderView {
    class func collectionHeaderView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
