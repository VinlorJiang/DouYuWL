//
//  RecommendGameView.swift
//  DouYuWL
//
//  Created by dinpay on 2017/7/27.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"

private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    var gameModel : [BaseGameModel]? {
        didSet {
            collectionView.reloadData()
        }
    }

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    // MARK:-  系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        //
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }

}

// MARK:- 快速创建的类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

// MARK:- 遵守UICollectionView的数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameModel?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath)
         as! CollectionGameCell
        
        cell.gameModel = gameModel![(indexPath as NSIndexPath).item]

        return cell
    }
}





