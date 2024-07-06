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
