//  PaymentVC.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//
import UIKit
import SnapKit

class PaymentVC: UIViewController {
    var paymentView: PaymentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium()]
        }
        paymentView.delegate = self
    }
    override func loadView() {
        super.loadView()
        paymentView = PaymentView(frame: self.view.frame)
        self.view = paymentView
    }
}

extension PaymentVC: ShoppingListDelegate {
    func shoppingListCount() -> Int {
        return CoffeeClubList.getShoppingList().count
    }
    
    func addShoppingList(index: Int) -> CoffeeClubList{
        return CoffeeClubList.getShoppingList()[index]
    }
    
    func stepAmount(data: CoffeeClubList, oper: Oper) {
        CoffeeClubList.stepAmount(oper: oper, coffeeClubList: data)
        NotificationCenter.default.post(name: NSNotification.Name("amountChanged"), object: nil)
    }
}
protocol ShoppingListDelegate: AnyObject  {
    func addShoppingList(index: Int) -> CoffeeClubList
    func shoppingListCount() -> Int
    func stepAmount(data: CoffeeClubList, oper: Oper)
}
