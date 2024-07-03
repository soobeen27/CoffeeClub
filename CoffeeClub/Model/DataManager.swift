////
////  File.swift
////  CoffeeClub
////
////  Created by Soo Jang on 7/3/24.
////
////
//import Foundation
//
//class DataManager {
//    static let shared = DataManager()
//    
//    private init() {}
//    
//    var shoppingList: [CoffeeClubList]?
//    
////    func getWholeMenu() -> [CoffeeClubList] {
////        return [
////            CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
////            CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
////            CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "decaffeine"),
////            CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "decaffeine"),
////            CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee"),
////            CoffeeClubList(imageName: "coffee1", menuName: "아메리카노", menuPrice: 5000, type: "coffee")
////        ]
////    }
//    
//    func categories(type: String) -> [CoffeeClubList] {
//        var tap = CoffeeClubList.list
//        tap.removeAll { $0.type != type }
//        return tap
//    }
//    
//    
//    func getShoppingList() -> [CoffeeClubList]{
//        guard let shoppingList = self.shoppingList else { return [CoffeeClubList]() }
//        return shoppingList
//    }
//    
//    func addToShoppingList(data: CoffeeClubList) {
//        shoppingList?.append(data)
//    }
//    
////    func getShopptingListCount() -> Int {
////        guard let shoppingList = self.shoppingList else { return 0}
////        return shoppingList.count
////    }
//    
//    func removeFromShoppingList(data: CoffeeClubList) -> [CoffeeClubList]{
//        guard let shoppingList = self.shoppingList else { return [CoffeeClubList]() }
//        return shoppingList.filter {
//            $0.menuName != data.menuName
//        }
//    }
//}
