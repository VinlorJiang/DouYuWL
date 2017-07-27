//
//  GameViewModel.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var gameModel : [GameModel] = [GameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallback : @escaping () -> ())  {
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            // 1.获取到数据
            guard let resultDic = result as? [String : Any] else { return }
            guard let dataArray = resultDic["data"] as? [[String : Any]] else { return }
            
            // 2.字典转模型
            for dict in dataArray {
                
                self.gameModel.append(GameModel(dict: dict))
            }
            // 3.完成回调
            finishedCallback()
        }
    }
}
