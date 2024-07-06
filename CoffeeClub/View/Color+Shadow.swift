//
//  Shadow.swift
//  CoffeeClub
//
//  Created by 임혜정 on 7/6/24.
//

import UIKit


// 컬러값을 헥사코드로 표현가능하게
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        let a = CGFloat(1.0)
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

// MARK: - 쉐도우
extension UIView {
    func buttonShadow(cornerRadius: CGFloat, shadowColor: UIColor = .black, shadowOpacity: Float = 0.1, shadowOffset: CGSize = CGSize(width: 2, height: 2), shadowRadius: CGFloat = 4) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
    }
}

extension UIView {
    func applyShadow() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 0.0
        self.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.4
    }
}
