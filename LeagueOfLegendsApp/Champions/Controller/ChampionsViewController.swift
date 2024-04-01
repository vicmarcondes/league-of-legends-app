//
//  ViewController.swift
//  LeagueOfLegendsApp
//
//  Created by Victor Moreno on 31/03/24.
//

import UIKit

class ChampionsViewController: UIViewController {
    var screen: ChampionsViewScreen?
    var champions: [Champion] = [
        Champion(name: "Akali", image: UIImage(named: "Akali")),
        Champion(name: "Akali", image: UIImage(named: "Akali")),
        Champion(name: "Akali", image: UIImage(named: "Akali")),
        Champion(name: "Akali", image: UIImage(named: "Akali")),
        Champion(name: "Akali", image: UIImage(named: "Akali")),
        Champion(name: "Akali", image: UIImage(named: "Akali")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configCollectionView(delegate: self, dataSource: self)
    }
    
    override func loadView() {
        screen = ChampionsViewScreen()
        view = screen
    }
}

extension ChampionsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return champions.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
//        return CGSize(width: size, height: size)
        
//        return CGSize(width: collectionView.frame.size.width, height: 300)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChampionsCollectionViewCell.identifier, for: indexPath) as? ChampionsCollectionViewCell
        cell?.setupCell(champion: champions[indexPath.row])
        return cell ?? UICollectionViewCell()
        
    }
    
}
