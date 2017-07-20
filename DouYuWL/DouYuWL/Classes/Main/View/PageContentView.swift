//
//  PageContentView.swift
//  DouYuWL
//
//  Created by apple on 2017/7/19.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

fileprivate let ContentCellID = "ContentCellID"

class PageContentView: UIView {
    
    // MARK:- 定义属性
    fileprivate var childVcs : [UIViewController]
    // weak 只能修饰可选类型
    fileprivate weak var parentViewController : UIViewController?

    // MARK:- 懒加载 UICollectionView block定义要用weak形式
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in
        // 1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        // 2.创建UICollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        
        // 3.设置数据源
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 4.注册cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)

        return collectionView
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        // UI 界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
// MARK:- 设置 UI 界面
extension PageContentView {
    fileprivate func setupUI() {
        // 1.将子控制器添加到父控制器
        for childVc in childVcs {
            parentViewController?.addChildViewController(childVc)
        }
        
        // 2.添加 UICollectionView，用于在cell中存放控制器的 view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
    
}
// MARK:- 遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 1.创建cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        
        // 2.给cell设置内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[(indexPath as NSIndexPath).item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}
// MARK:- 遵守UICollectionViewDelegate
extension PageContentView : UICollectionViewDelegate {
}


