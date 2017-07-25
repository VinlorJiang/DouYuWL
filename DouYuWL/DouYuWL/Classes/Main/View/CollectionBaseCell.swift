//
//  CollectionBaseCell.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    
    // MARK:- 空间属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    // MARK:- 定义模型
    var anchor : AnchorModel? {
        didSet {
            // 
            guard let anchor = anchor else { return }
            
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: UIControlState())
            
            nickNameLabel.text = anchor.nickname
            
            guard let iconURL = URL(string : anchor.vertical_src) else { return }
            
            iconImageView.kf.setImage(with: iconURL)
            
        }
        
    }
    
}
