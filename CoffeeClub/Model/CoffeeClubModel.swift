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
        CoffeeClubList(imageName: "coffee1", menuName: "카페라떼", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "coffee1", menuName: "디카페인 아메리카노", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "coffee1", menuName: "디카페인 카페라떼", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "coffee1", menuName: "치즈케이크", menuPrice: 5000, type: "dessert"),
        CoffeeClubList(imageName: "coffee1", menuName: "허니브레드", menuPrice: 5000, type: "dessert"),
        CoffeeClubList(imageName: "coffee1", menuName: "초코케이크", menuPrice: 5000, type: "dessert"),
        CoffeeClubList(imageName: "mint_sparkling", menuName: "민트 스파클링 에스프레소", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "salted_caramel_espresso", menuName: "솔티드 캐러멜 에스프레소", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "iced_peppermint_mocha", menuName: "아이스 페퍼민트 모카", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "viet_iced", menuName: "베트남 아이스 커피", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "nutmeg_latte", menuName: "너트멕 라테", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "iced_caramel_vanila", menuName: "아이스 캬라멜 라테", menuPrice: 5000, type: "coffee")
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
    
    static func getTotalPrice() -> Int {
        var totalPrice: Int = 0
        getShoppingList().forEach {
            totalPrice += ($0.menuPrice * $0.amount)
        }
        return totalPrice
    }
    
    static func stepAmount(oper: Oper, coffeeClubList: CoffeeClubList) {
        for i in 0..<list.count {
            if list[i].menuName == coffeeClubList.menuName {
                oper == .plus ? (list[i].amount += 1) : (list[i].amount -= 1)
            }
        }
    }
}

enum Oper {
    case plus
    case minus
}
