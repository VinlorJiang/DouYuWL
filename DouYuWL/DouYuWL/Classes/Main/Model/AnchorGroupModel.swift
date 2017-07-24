//
//  AnchorGroupModel.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class AnchorGroupModel : BaseGameModel {
    // 1.改组中房间对应的信息
    var room_list : [[String : NSObject]]? {
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                anchors.append(AnchorModel(dict:dict))
            }
        }
    }
    
    // 2.组显示的图标
    var icon_name : String = "home_header_normal"
    
    // 3.定义主播的模型对象数组
    lazy var anchors : [AnchorModel] = [AnchorModel]()
}
