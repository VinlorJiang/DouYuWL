//
//  UIBarButtonItem-Extention.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/19.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    // 1.第一种方法 类方法
   /*
    class func createItem(imageName : String, highlightedImageName : String = "", size : CGSize = CGSize.zero) -> UIBarButtonItem {
    
        let btn = UIButton()
        
        btn.setImage(UIImage(named : imageName), for: .normal)
        btn.setImage(UIImage(named : highlightedImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    */
    
    // 便利构造函数: 1> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数(self)
    convenience init(imageName : String, highlightedImageName : String = "", size : CGSize = CGSize.zero) {
        
        // 1.创建 btn
        let btn = UIButton()
        
        // 2.设置 btn 的图片
        btn.setImage(UIImage(named : imageName), for: .normal)
        if highlightedImageName != "" {
            btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)
        }
        
        // 3.设置 btn 的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView : btn)
    }
    
}
