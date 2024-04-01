//
//  ChampionsCollectionViewCell.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import UIKit

class ChampionsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChampionsCollectionViewCell"
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black    
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(champion: Champion) {
        imageView.image = champion.image
        nameLabel.text = champion.name
    }
    
    private func addElements() {
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
//            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -8),
            
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
