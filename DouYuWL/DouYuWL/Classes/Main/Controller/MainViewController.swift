//
//  MainViewController.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/19.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVc(storyboardName: "Home")
        addChildVc(storyboardName: "Live")
        addChildVc(storyboardName: "Follow")
        addChildVc(storyboardName: "Profile")

    }
    
   fileprivate func addChildVc(storyboardName : String) {
        
        let childVc = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVc)
        
    }
}
