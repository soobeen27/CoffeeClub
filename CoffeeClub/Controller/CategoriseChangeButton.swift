//
//  CategoriseChangeButton.swift
//  CoffeeClub
//
//  Created by 유민우 on 7/4/24.
//

import UIKit

class CategoriseChangeButton: NSObject {
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
        super.init()
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let vc = viewController else { return }
        switch sender.tag {
        case 1:
            vc.coffeeList = CoffeeClubList.categories(type: "coffee")
        case 2:
            vc.coffeeList = CoffeeClubList.categories(type: "decaffeine")
        case 3:
            vc.coffeeList = CoffeeClubList.categories(type: "dessert")
        default:
            vc.coffeeList = CoffeeClubList.list
        }
        vc.coffeeCollectionView.reloadData()
        
    }
}
