//
//  NetWorkTool.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetWorkTools {
    class func requestData (_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishCallback : @escaping (_ result : Any) -> ()) {
        // 1. 获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发生网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error ?? "no error")
                return
            }
            // 4.将结果回调出去
            finishCallback(result)
        }
        
        
    }
}
