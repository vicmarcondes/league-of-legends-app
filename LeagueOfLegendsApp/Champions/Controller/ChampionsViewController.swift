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
    var championsFiltered: [Champion]?
    var service = ChampionsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllRequest()
    }
    
    override func loadView() {
        screen = ChampionsViewScreen()
        screen?.configureTextFieldDelegate(delegate: self)
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
                self.championsFiltered = self.champions
                
                
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
        return championsFiltered?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChampionsCollectionViewCell.identifier, for: indexPath) as? ChampionsCollectionViewCell
        let champion = championsFiltered![indexPath.row] as Champion
        
        cell?.imageView.sd_setImage(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champion.id)_0.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        cell?.setupCell(champion: champion)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ChampionDetailController()
        let selectedChampion = championsFiltered![indexPath.row]
        vc.championId = selectedChampion.id
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ChampionsViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        
        
        if !text.isEmpty {
            championsFiltered = champions?.filter({ champion in
                return champion.name.contains(text)
            })
        } else {
            championsFiltered = champions
        }
        
        
        
        screen?.collectionView.reloadData()
    }
}
