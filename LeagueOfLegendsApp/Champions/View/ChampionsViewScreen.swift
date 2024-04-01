//
//  ChampionsViewScreen.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import UIKit

class ChampionsViewScreen: UIView {
    
    lazy var collectionView: UICollectionView = {
//        let flow = TwoC()
//        flow.scrollDirection = .vertical
//        flow.minimumLineSpacing = 10
//        flow.minimumLineSpacing = 10
//        flow.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: TwoColumnFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(ChampionsCollectionViewCell.self, forCellWithReuseIdentifier: ChampionsCollectionViewCell.identifier)
        cv.backgroundColor = .white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configContraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(collectionView)
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
}
