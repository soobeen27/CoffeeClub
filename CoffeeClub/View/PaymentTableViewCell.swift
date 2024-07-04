//
//  CustomPaymentTableViewCell.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//

import UIKit
import SnapKit

class PaymentTableViewCell: UITableViewCell {
    var coffeeClubList: CoffeeClubList? {
        didSet {
            guard let coffeeClubList = coffeeClubList else { return }
            itemName.text = "\(coffeeClubList.menuName)"
            itemPrice.text = (coffeeClubList.menuPrice * coffeeClubList.amount).numberFormat()
            amountLabel.text = String(coffeeClubList.amount)
        }
    }
    weak var delegate: ShoppingListDelegate?
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.backgroundColor = .black
        btn.addAction(UIAction { _ in
            CoffeeClubList.stepAmount(oper: .plus, coffeeClubList: self.coffeeClubList!)
            self.coffeeClubList?.amount += 1
        }, for: .touchDown)
        return btn
    }()
    
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.addAction(UIAction { _ in
            CoffeeClubList.stepAmount(oper: .minus, coffeeClubList: self.coffeeClubList!)
            self.coffeeClubList?.amount -= 1
        }, for: .touchDown)
        return btn
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    lazy var hSV: UIStackView = {
        let st = UIStackView(arrangedSubviews: [minusBtn, amountLabel, plusBtn])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .center
        st.spacing = 16
        return st
    }()
    
    let itemName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = modalColor.text
        label.textAlignment = .right
        return label
    }()
    
    let itemPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = modalColor.text
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLayout() {
        self.backgroundColor = .clear
        [itemName, itemPrice, hSV].forEach {
            self.contentView.addSubview($0)
        }
        itemName.snp.makeConstraints { 
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().offset(-24)
        }
        itemPrice.snp.makeConstraints {
            $0.top.equalTo(itemName.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-24)
        }
        hSV.snp.makeConstraints {
            $0.top.equalTo(itemPrice.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-16)
        }
        plusBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
        minusBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 30, height: 30))
        }
        plusBtn.layer.cornerRadius = 15
        minusBtn.layer.cornerRadius = 15
    }
}
