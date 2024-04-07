//
//  ChampionDetailController.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import UIKit

class ChampionDetailController: UIViewController {
    
    var screen: ChampionDetailScreen?
    var service = ChampionsService()
    var championDetail: ChampionDetail?
    var championId: String?
    
    var isDarkMode: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchAllRequest()
        setupStyle()
    }
    
    override func loadView() {
        screen = ChampionDetailScreen()
        view = screen

    }
    
    private func setupStyle() {
        let color = isDarkMode! ? UIColor.white : UIColor.black
        let backgroundColor = isDarkMode! ? UIColor.black : UIColor.white
        
        screen?.nameLabel.textColor = color
        screen?.loreLabel.textColor = color
        screen?.subtitleLabel.textColor = color
        
        screen?.backgroundColor = backgroundColor
    }
    
    func fetchAllRequest() {
        service.getChampionDetail(championId: self.championId ?? "Akali") { championDetailData, error in
            if error == nil {
                self.championDetail = championDetailData?.data[self.championId ?? "Akali"]
                
//                if let detail = self.championDetail {
                    DispatchQueue.main.async {
                        self.screen!.setupData(championDetail: self.championDetail!)
                        self.screen!.championImage.sd_setImage(with: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(self.championId ?? "Akali")_0.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
                    }
//                }
            } else {
//                self.delegate?.error()
            }
        }
    }
    

}
