//
//  UICollectionViewFlowLayout + Extension.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import UIKit

class TwoColumnFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        let minColumnWidth: CGFloat = 150.0
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        let cellSize = CGSize(width: cellWidth, height: 150) // Ajuste a altura conforme necessário
        
        itemSize = cellSize
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
    }
}
