//
//  PaymentVC.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//
import UIKit
import SnapKit

class PaymentVC: UIViewController {

    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium()]
        }
        setupTableView()
        setLayout()
    }
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "PaymentTableViewCell")
    }
    
    func setLayout() {
        view.addSubview(tableView)
        view.backgroundColor = .brown
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 8, bottom: 30, right: 8))
        }
    }
}

extension PaymentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingList.nameAndPrice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        cell.selectionStyle = .none
        cell.receipt = ShoppingList.nameAndPrice[indexPath.row]
        return cell
    }
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
