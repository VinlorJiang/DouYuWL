//
//  NSDate-Extension.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import Foundation

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int( nowDate.timeIntervalSince1970 )
        
        return "\(interval)"
    }
}
