//
//  CollectionCycleCell.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageview: UIImageView!
    @IBOutlet weak var titleNameLabel: UILabel!

    // MARK:- 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            titleNameLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")!
            iconImageview.kf.setImage(with: iconURL, placeholder: UIImage(named: "Img_default"))
            
        }
    }
    
}
