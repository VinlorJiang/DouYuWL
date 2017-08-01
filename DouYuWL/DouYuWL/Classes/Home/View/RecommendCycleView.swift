//
//  RecommendCycleView.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/25.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    var cycleTimer : Timer?
    
    // MARK:- 懒加载装着CycleModel模型的数组
    var cycleModels : [CycleModel]? {
        didSet {
            // 1. 刷新collectionView
            collectionView.reloadData()
            
            // 2. 设置pageControl的个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            // 3. 默认滚动到中间某个位置
            let indexPath = IndexPath(item: (cycleModels?.count ?? 0) * 10, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            
            // 4. 添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    // MARK:- 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: 系统回调函数
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        
//        collectionView.dataSource = self
//        collectionView.delegate = self
        // 注册cell
        
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
       
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置collectionView的layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.scrollDirection = .horizontal
//        collectionView.isPagingEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}
// MARK:- 遵守UICollectionView的数据源协议
extension RecommendCycleView : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.cycleModels?.count ?? 0) * 10000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
//        cell.cyleModel = cycleModel
//        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.orange
        return cell
        
    }
    
}

// MARK:- 遵守UICollectionView的代理协议
extension RecommendCycleView : UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1. 获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2. 计算pageController的currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

// MARK:- 对定时器的操作方法
extension RecommendCycleView {
    fileprivate func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollTotNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: RunLoopMode.commonModes)
    }
    fileprivate func removeCycleTimer() {
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    @objc private func scrollTotNext() {
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        
        // 滚动到该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}
