//
//  RecommendViewController.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/21.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

class RecommendViewController: BaseAnchorViewController {
    
    // MARK:- 懒加载属性
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    fileprivate lazy var cycleView : RecommendCycleView = {
         let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    
   

}
// MARK:- 设置界面内容
extension RecommendViewController {
    override func setupUI() {
        // 1.先调用super.setupUI()
        super.setupUI()
        
        // 2.将CycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)
        
        // 3.将gameView添加collectionView中
        
        // 4.设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK:- 请求数据
extension RecommendViewController {
    override func loadData()
    // 0.给父类中的ViewModel进行赋值
    baseVM = recommendVM
    
    // 1.请求推荐数据
    
    // 1.展示推荐数据
}


