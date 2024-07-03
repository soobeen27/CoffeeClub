//
//  PaymentView.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/3/24.
//

import UIKit

class PaymentView: UIView {
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.register(PaymentTableViewCell.self, forCellReuseIdentifier: "PaymentTableViewCell")
        return tv
    }()
    weak var delegate: ReceiptDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLayout() {
        self.addSubview(tableView)
        self.backgroundColor = .brown
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 8, bottom: 30, right: 8))
        }
    }
}

extension PaymentView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = delegate?.receiptCount() else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        cell.selectionStyle = .none
        cell.receipt = delegate?.addNewReceipt(index: indexPath.row)
        return cell
    }
}
