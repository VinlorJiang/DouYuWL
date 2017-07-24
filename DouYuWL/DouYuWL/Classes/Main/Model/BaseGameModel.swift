//
//  BaseGameModel.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {
    // MARK:- 定义属性
    var tag_name : String = ""
    var icon_uri : String = ""
    
    // MARK:- 自定义构造函数
    override init() {
        
    }
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
