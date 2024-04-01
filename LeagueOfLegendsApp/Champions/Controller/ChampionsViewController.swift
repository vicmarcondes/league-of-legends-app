//
//  ViewController.swift
//  LeagueOfLegendsApp
//
//  Created by Victor Moreno on 31/03/24.
//

import UIKit
import SDWebImage

class ChampionsViewController: UIViewController {
    var screen: ChampionsViewScreen?
    var champions: [Champion]?
    var service = ChampionsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllRequest()
    }
    
    override func loadView() {
        screen = ChampionsViewScreen()
        view = screen
    }
    
    func fetchAllRequest() {
        service.getChampions { championsData, error in
            if error == nil {
                var arrayFromDic = championsData!.data.values.map { $0 }
                arrayFromDic.sort { c1, c2 in
                    c1.name < c2.name
                }
                self.champions = arrayFromDic
                
                
                DispatchQueue.main.async {
                    self.screen?.configCollectionView(delegate: self, dataSource: self)
                }
            } else {
//                self.delegate?.error()
            }
        }
    }
}



extension ChampionsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return champions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChampionsCollectionViewCell.identifier, for: indexPath) as? ChampionsCollectionViewCell
        let champion = champions![indexPath.row] as Champion
        
        cell?.imageView.sd_setImage(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champion.id)_0.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        cell?.setupCell(champion: champion)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
