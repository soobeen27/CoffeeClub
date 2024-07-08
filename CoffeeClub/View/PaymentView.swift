//
//  PaymentView.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/3/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class PaymentView: UIView {
    let coffeeList = CoffeeClubModel.shared
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = modalColor.background
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
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(hex: "#cd2323")
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
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = UIColor(hex: "#cd2323")
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    weak var delegate: ShoppingListDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLayout() {
        [tableView, paymentBtn, hSTV].forEach {
            self.addSubview($0)
        }
        paymentBtn.layer.cornerRadius = 10

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
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.height.equalTo(50)
        }
    }
}

struct modalColor {
    private init() {}
    static let text: UIColor = .black
    static let background: UIColor = .white
}
