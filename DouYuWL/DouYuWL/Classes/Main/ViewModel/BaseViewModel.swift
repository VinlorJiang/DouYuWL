//
//  BaseViewModel.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
class BaseViewModel {
    lazy var anchorGroupModel : [AnchorGroupModel] = [AnchorGroupModel]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData : Bool, URLString : String, parameters : [String : Any]? = nil, finishedCallback : () -> ()) {
        NetWorkTools.requestData(.get, URLString: URLString, parameters: parameters) { (result) in
            // 1.对界面进行处理
            guard let resultDic = result as? [String : Any] else { return }
            guard let dataArray = resultDic["data"] as? [[String : Any]] else { return }
            
            // 2.判断是否分组数据
            if isGroupData {
                // 2.1.遍历数组中的字典
                for dic in dataArray {
                    self.anchorGroupModel.append(AnchorGroupModel(dic:dic))
                }
            } else {
                // 2.1.创建组
                let group = AnchorGroupModel()
                // 2.2.遍历dataArray的所有的字典
                for dic in dataArray {
                    group.anchors.append(AnchorGroupModel(dic : dic))
                }
                // 2.3.将group,添加到anchorGroups
                self.anchorGroupModel.append(group)
            }
            // 3.完成回调
            finishedCallback()
        }
    }
}
