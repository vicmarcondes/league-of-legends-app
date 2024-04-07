//
//  ChampionsViewScreen.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 01/04/24.
//

import UIKit

protocol ChampionsViewScreenProtocol: AnyObject {
    func darkModeTapped()
}

class ChampionsViewScreen: UIView {
    
    private weak var delegate: ChampionsViewScreenProtocol?
    
    func delegate(delegate: ChampionsViewScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var searchIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        tf.addPlaceholder(text: "Eg.: Akali", placeholderColor: .lightGray)
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 16, weight: .light)
        tf.addLeftPadding(paddingValue: 8)
        tf.addRightPadding(paddingValue: 8)
        return tf
    }()
    
    lazy var darkModeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysTemplate)
            , for: .normal)
        button.imageView?.tintColor = .white
        button.addTarget(self, action: #selector(darkModeTapped), for: .touchUpInside)
//        button.imageView?.backgroundColor = .white
        return button
    }()
    
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
        cv.backgroundColor = .black
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configContraints()
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func configureTextFieldDelegate(delegate: UITextFieldDelegate) {
        searchTextField.delegate = delegate
    }
    
    @objc private func darkModeTapped() {
        delegate?.darkModeTapped()
    }
    
    private func addElements() {
        addSubview(collectionView)
        addSubview(searchIcon)
        addSubview(searchTextField)
        addSubview(darkModeButton)
    }
    
    private func configContraints() {
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            searchIcon.widthAnchor.constraint(equalToConstant: 22),
            searchIcon.heightAnchor.constraint(equalToConstant: 22),
            
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: darkModeButton.leadingAnchor, constant: -16),
            searchTextField.heightAnchor.constraint(equalToConstant: 36),
            
            darkModeButton.widthAnchor.constraint(equalToConstant: 36),
            darkModeButton.heightAnchor.constraint(equalToConstant: 36),
            darkModeButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            darkModeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            
            collectionView.topAnchor.constraint(equalTo: searchIcon.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
        ])
    }
    
}
