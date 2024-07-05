//
//  Expression.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//

import Foundation
import UIKit

extension Int {
    func numberFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) else { return "" }
        return formattedNumber + "원"
    }
}

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
