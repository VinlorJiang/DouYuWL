//
//  CollectionGameCell.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {

    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var gameModel : BaseGameModel? {
        didSet {
            self.nameLabel.text = gameModel?.tag_name
            if let iconURL = URL(string: gameModel?.icon_uri ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "home_more_btn")
            }
        }
    }
    

}
