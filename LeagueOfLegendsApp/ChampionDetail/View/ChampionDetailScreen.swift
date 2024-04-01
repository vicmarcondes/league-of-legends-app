//
//  ChampionDetailScreen.swift
//  LeagueOfLegendsApp
//
//  Created by Victor Moreno on 02/04/24.
//

import UIKit

class ChampionDetailScreen: UIView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var championImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Akali")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var loreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 12
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(championDetail: ChampionDetail) {
        nameLabel.text = championDetail.name
        subtitleLabel.text = championDetail.title
        loreLabel.text = championDetail.lore
    }
    
    private func addElements() {
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(championImage)
        addSubview(loreLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                

            subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            championImage.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            championImage.widthAnchor.constraint(equalTo: widthAnchor),
            championImage.heightAnchor.constraint(equalToConstant: 300),
            
            loreLabel.topAnchor.constraint(equalTo: championImage.bottomAnchor, constant: 24),
            loreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            loreLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 16)
//            loreLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
