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
    var amount: Int = 0
    
    init(imageName: String, menuName: String, menuPrice: Int, type: String, amount: Int = 0) {
        self.imageName = imageName
        self.menuName = menuName
        self.menuPrice = menuPrice
        self.type = type
        self.amount = amount
    }
}

class CoffeeClubModel {
    static let shared = CoffeeClubModel()
    private init() {}
    
    var list = [
        CoffeeClubList(imageName: "mint_sparkling2", menuName: "민트 스파클링 에스프레소", menuPrice: 6500, type: "coffee"),
        CoffeeClubList(imageName: "salted_caramel_espresso", menuName: "솔티드 캐러멜 에스프레소", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "iced_peppermint_mocha", menuName: "아이스 페퍼민트 모카", menuPrice: 5500, type: "coffee"),
        CoffeeClubList(imageName: "viet_iced", menuName: "베트남 아이스 커피", menuPrice: 5000, type: "coffee"),
        CoffeeClubList(imageName: "nutmeg_latte", menuName: "너트멕 라테", menuPrice: 7500, type: "coffee"),
        CoffeeClubList(imageName: "iced_caramel_vanila", menuName: "아이스 캬라멜 라테", menuPrice: 6000, type: "coffee"),
        CoffeeClubList(imageName: "hot_chocolate_decaf", menuName: "핫 초콜릿", menuPrice: 5500, type: "decaffeine"),
        CoffeeClubList(imageName: "iced_coconut_decaf", menuName: "아이스 코코넛 라테", menuPrice: 5000, type: "decaffeine"),
        CoffeeClubList(imageName: "caramel_apple_spice_decaf", menuName: "카라멜 애플 스파이스", menuPrice: 6000, type: "decaffeine"),
        CoffeeClubList(imageName: "golden_latte_decaf", menuName: "디카페인 카페라떼", menuPrice: 6000, type: "decaffeine"),
        CoffeeClubList(imageName: "ice_cream_choc", menuName: "초코시럽 & 아이스크림", menuPrice: 10000, type: "dessert"),
        CoffeeClubList(imageName: "ice_cream_kitkat", menuName: "킷캣 & 아이스크림", menuPrice: 12000, type: "dessert"),
        CoffeeClubList(imageName: "flapjacks", menuName: "플랩잭", menuPrice: 18000, type: "dessert"),
        CoffeeClubList(imageName: "blueberry_muffin", menuName: "블루베리 머핀", menuPrice: 6000, type: "dessert"),
    ]
    // MARK: 탭버튼에 따른 리스트 변경
    func categories(type: String) -> [CoffeeClubList] {
        if type == "all" {
            return list
        }
        return list.filter { $0.type == type }
    }
    
    // MARK: 주문수량, 가격 관련
    
    func getShoppingList() -> [CoffeeClubList] {
        return list.filter { $0.amount > 0 }
    }
    
    func addShopingList(coffeeClubList: CoffeeClubList) {
        for i in 0..<list.count {
            if list[i].imageName == coffeeClubList.imageName {
                list[i].amount += 1
            }
        }
    }
    
    func getAmount() -> Int {
        var total = 0
        getShoppingList().forEach {
            total += $0.amount
        }
        return total
    }
    
    func getTotalPrice() -> Int {
        var totalPrice: Int = 0
        getShoppingList().forEach {
            totalPrice += ($0.menuPrice * $0.amount)
        }
        return totalPrice
    }
    
    func stepAmount(oper: Oper, coffeeClubList: CoffeeClubList) {
        for i in 0..<list.count {
            if list[i].imageName == coffeeClubList.imageName {
                oper == .plus ? (list[i].amount += 1) : (list[i].amount -= 1)
            }
        }
    }
}

enum Oper {
    case plus
    case minus
}
