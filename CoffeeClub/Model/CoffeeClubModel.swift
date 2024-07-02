//
//  CoffeeClubModel.swift
//  CoffeeClub
//
//  Created by 임혜정 on 7/2/24.
//

import Foundation

struct CoffeeClubList {
    let imageName: String
    let menuName: String
    let menuPrice: Int
    let type: String
}

extension CoffeeClubList {
    static let list = [
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee")
    ]
    
    static func coffeeOnly() -> [CoffeeClubList] {
        var tap = list
        tap.removeAll { $0.type != "coffee" }
        return tap
    }
    
}
