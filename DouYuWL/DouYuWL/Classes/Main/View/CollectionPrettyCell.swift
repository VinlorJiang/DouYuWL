//
//  CollectionPrettyCell.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class CollectionPrettyCell: CollectionBaseCell {

    // MARK:- 空间属性
    
    @IBOutlet weak var cityBtn: UIButton!
    
  
    override var anchor : AnchorModel? {
        didSet {
           super.anchor = anchor
            
            cityBtn.setTitle(anchor?.anchor_city, for: UIControlState())
        }
    }

}
