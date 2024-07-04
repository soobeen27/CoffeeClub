//
//  PaymentView.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/3/24.
//

import UIKit
import SnapKit

class PaymentView: UIView {
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = modalColor.background
        tv.separatorStyle = .none
        tv.register(PaymentTableViewCell.self, forCellReuseIdentifier: "PaymentTableViewCell")
        return tv
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.text = "상품금액"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy var totalPrice: UILabel = {
        let label = UILabel()
        label.text = "50,000원"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .red
        label.textAlignment = .right
        return label
    }()
    
    lazy var hSTV: UIStackView = {
       let st = UIStackView(arrangedSubviews: [productPrice, totalPrice])
        st.axis = .horizontal
        st.distribution = .fillEqually
        return st
    }()
    
    let paymentBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("결제하기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        return btn
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
        [tableView, paymentBtn, hSTV].forEach {
            self.addSubview($0)
        }
        paymentBtn.layer.cornerRadius = 25

        self.backgroundColor = modalColor.background
        tableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.top.equalToSuperview().offset(16)
        }
        hSTV.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(50)
        }
        
        paymentBtn.snp.makeConstraints {
            $0.top.equalTo(hSTV.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
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

struct modalColor {
    private init() {}
    static let text: UIColor = .black
    static let background: UIColor = .white
}
