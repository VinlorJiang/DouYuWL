//
//  CollectionNormalCell.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {

    // MARK:- 空间属性
    @IBOutlet weak var roomNameLabel: UILabel!
    
    
    
    
    // MARK:- 定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            super.anchor = anchor
            
            roomNameLabel.text = anchor?.room_name
        }
    }
    

}
