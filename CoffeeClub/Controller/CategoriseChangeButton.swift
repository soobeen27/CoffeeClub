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
        
        vc.headerView.thisButtonTap(selectedButton: sender)
        
        switch sender.tag {
        case 2:
            vc.coffeeList = CoffeeClubModel.categories(type: "coffee")
        case 3:
            vc.coffeeList = CoffeeClubModel.categories(type: "decaffeine")
        case 4:
            vc.coffeeList = CoffeeClubModel.categories(type: "dessert")
        default:
            vc.coffeeList = CoffeeClubModel.list
        }
        vc.coffeeCollectionView.reloadData()
        
    }
}
