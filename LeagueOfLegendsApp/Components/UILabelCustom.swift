//
//  UILabelCustom.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 07/04/24.
//

import Foundation
import UIKit

class UILabelCustom: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        textColor = .white
    }
    
    public func updateStyle(isDarkMode: Bool) {
        let mainColor = isDarkMode ? UIColor.white :  .black
        
        UIView.animate(withDuration: 0.4) {
            self.textColor = mainColor
        }
    }
    
}
