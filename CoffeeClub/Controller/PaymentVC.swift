//
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

extension PaymentVC: ReceiptDelegate {
    func receiptCount() -> Int {
        return ShoppingList.nameAndPrice.count
    }
    
    func addNewReceipt(index: Int) -> Receipt{
        return ShoppingList.nameAndPrice[index]
    }
}

protocol ReceiptDelegate: AnyObject  {
    func addNewReceipt(index: Int) -> Receipt
    func receiptCount() -> Int
}

struct Receipt {
    let menuName: String
    let price: Int
    let amount: Int
}

struct ShoppingList {
    static let nameAndPrice: [Receipt] = [
        Receipt(menuName: "Americano", price: 1500, amount: 1),
        Receipt(menuName: "Caffe Latte", price: 2000, amount: 2),
        Receipt(menuName: "Cappuccino", price: 2000, amount: 3),
        Receipt(menuName: "Espresso", price: 1000, amount: 4),
        Receipt(menuName: "Caramel Macchiato", price: 2500, amount: 5),
        Receipt(menuName: "affogato", price: 3000, amount: 6),
        ]
}
