//  PaymentVC.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class PaymentVC: UIViewController {
    var paymentView: PaymentView!
    var coffeeList = CoffeeClubModel.shared
    let disposeBag = DisposeBag()
    lazy var rxList = coffeeList.shoppingList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium()]
        }
        valueChanged()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coffeeList.shoppingList.accept(coffeeList.getShoppingList())
    }

    override func loadView() {
        super.loadView()
        paymentView = PaymentView(frame: self.view.frame)
        self.view = paymentView
    }
    func valueChanged() {
        coffeeList.rxList.subscribe(onNext: { _ in
            self.coffeeList.shoppingList.accept(self.coffeeList.getShoppingList())
        }).disposed(by: disposeBag)
        
        coffeeList.shoppingList.asObservable().bind(to: paymentView.tableView.rx.items(cellIdentifier: "PaymentTableViewCell", cellType: PaymentTableViewCell.self)) { (row, item, cell) in
            self.setTableViewCell(cell: cell, item: item)
            self.setPaymentViewValue()
            cell.selectionStyle = .none
            cell.minusBtn.rx.tap
                 .subscribe(onNext: { [weak self] in
                     guard let self = self else { return }
                     self.coffeeList.stepAmount(oper: .minus, menuName: cell.itemName.text!)
                     self.coffeeList.shoppingList.accept(self.coffeeList.getShoppingList())
                 })
                 .disposed(by: cell.disposeBag)
             
             cell.plusBtn.rx.tap
                 .subscribe(onNext: { [weak self] in
                     guard let self = self else { return }
                     self.coffeeList.stepAmount(oper: .plus, menuName: cell.itemName.text!)
                     self.coffeeList.shoppingList.accept(self.coffeeList.getShoppingList())
                 })
                 .disposed(by: cell.disposeBag)
        }
        .disposed(by: disposeBag)
    }
    
    func setPaymentViewValue() {
        paymentView.totalPrice.text = coffeeList.getTotalPrice().numberFormat()
    }
    
    func setTableViewCell(cell: PaymentTableViewCell, item: CoffeeClubList) {
        cell.itemName.text = "\(item.menuName)"
        cell.itemPrice.text = "\(item.menuPrice * item.amount)"
        cell.amountLabel.text = String(item.amount)
        cell.productImageView.image = UIImage(named: item.imageName)
    }
}

extension PaymentVC: ShoppingListDelegate {
    func shoppingListCount() -> Int {
        return coffeeList.getShoppingList().count
    }
    
    func addShoppingList(index: Int) -> CoffeeClubList {
        return coffeeList.getShoppingList()[index]
    }
    
}
protocol ShoppingListDelegate: AnyObject  {
    func addShoppingList(index: Int) -> CoffeeClubList
    func shoppingListCount() -> Int
}
