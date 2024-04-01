//
//  UITextField + Extension.swift
//  LeagueOfLegendsApp
//
//  Created by admin on 04/04/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func addPlaceholder(text: String, placeholderColor: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    func addLeftPadding(paddingValue: Int) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: 0))
        self.leftView = view
        self.leftViewMode = .always
    }
    
    func addRightPadding(paddingValue: Int) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: 0))
        self.rightView = view
        self.rightViewMode = .always
    }

    
}
