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
    var amount: Int = 0
    let type: String
}

extension CoffeeClubList {
    static var list = [
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee")
    ]
    //상단 탭바 눌렀을 때 
    static func categories(type: String) -> [CoffeeClubList] {
        var tap = list
        tap.removeAll { $0.type != type }
        return tap
    }
    
    static func getShoppingList() -> [CoffeeClubList]{
        return list.filter {
            $0.amount > 0
        }
    }
}
