//
//  RecommendViewModel.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class RecommendViewModel: BaseViewModel {
    
    // MARK:- 懒加载属性
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    fileprivate lazy var bigDataGroup : AnchorGroupModel = AnchorGroupModel()
    fileprivate lazy var prettyGroup : AnchorGroupModel = AnchorGroupModel()
}

// MARK:- 发起网络请求
extension RecommendViewModel {
    // 请求推荐数据
    func requestData(_ finishCallback: () -> ()) {
        // 1.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
        
        // 2.创建group
        let dgroup = DispatchGroup()
        
        // 3.请求第一份推荐数据
        dgroup.enter()
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: parameters) { (result) in
            // 3.1 将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            
            // 3.2 根据data的key，获取数组
            guard let dataArray = resultDic["data"] as? [[String : NSObject]] else { return }
            
            // 4.遍历字典  转成模型对象
            // 4.1 设置组的属性
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            // 4.2 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            // 4.3 离开group
            dgroup.leave()
        }
        
        // 5.请求第二部分颜值数据
        dgroup.enter()
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            // 5.1. 将result转成字典类型
            guard let resultDic = result as? [String : NSObject] else { return }
            
            // 5.2. 根据data该key,获取数组
            guard let dataArray = resultDic["data"] as? [String : NSObject] else { return }
            
            // 5.3. 遍历字典,并且转成模型对象
            // 5.3.1  设置组的属性
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            // 5.3.2 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            
            // 5.3.2 离开group
            dgroup.leave()
        }
        
        // 6.请求2-12部分数据
        dgroup.enter()
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { 
            dgroup.leave()
        }
        
        // 7.所有的参数都请求到后进行排序
        dgroup.notify(queue: DispatchQueue.main()) { 
            self.anchorGroupModels.insert(self.prettyGroup, at: 0)
            self.anchorGroupModels.insert(self.bigDataGroup, at: 0)
            
            finishCallback
        }
        
 }
    // 请求无限轮播数据
    func requestCycleData(_ finishCallback : () -> ()) {
        NetWorkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            // 1.获取整体字典数据
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [String : NSObject] else { return }
            
            // 3.字典转模型对象
            for dict in dataArray {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            finishCallback()
        }
    }

}
