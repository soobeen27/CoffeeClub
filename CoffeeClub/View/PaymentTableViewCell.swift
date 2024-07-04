//
//  CustomPaymentTableViewCell.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//

import UIKit
import SnapKit

class PaymentTableViewCell: UITableViewCell {
    var receipt: Receipt? {
        didSet {
            guard let receipt = receipt else { return }
            itemName.text = "\(receipt.menuName)"
            itemPrice.text = (receipt.price * receipt.amount).numberFormat()
            stepAmount.value = receipt.amount
        }
    }
    
    lazy var stepAmount: CustomStepper = {
        let stp = CustomStepper()
        stp.textColor = modalColor.text
        return stp
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
        [stepAmount, itemName, itemPrice].forEach {
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
        stepAmount.snp.makeConstraints {
            $0.top.equalTo(itemPrice.snp.bottom).offset(24)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
}

class CustomStepper: UIView {
    var value: Int {
        didSet {
            numLabel.text = "\(value)"
            print("value changed: \(value)")
        }
    }
    var textColor: UIColor
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.backgroundColor = .black
        return btn
    }()
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        return btn
    }()
    
    private lazy var numLabel: UILabel = {
        let label = UILabel()
        label.textColor = textColor
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    lazy var hSV: UIStackView = {
        let st = UIStackView(arrangedSubviews: [minusBtn, numLabel, plusBtn])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .center
        st.spacing = 16
        return st
    }()
    init() {
        self.value = 0
        self.textColor = .black
        super.init(frame: .zero)
        setLayout()
        minusBtn.addAction(UIAction { _ in
            self.value -= 1
        }, for: .touchDown)
        plusBtn.addAction(UIAction { _ in
            self.value += 1
        }, for: .touchDown)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setLayout() {
        hSV.translatesAutoresizingMaskIntoConstraints = false
        minusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hSV)
        
        plusBtn.layer.cornerRadius = 15
        minusBtn.layer.cornerRadius = 15
    
        NSLayoutConstraint.activate([
            hSV.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            hSV.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 26),
            hSV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26),
            hSV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            plusBtn.heightAnchor.constraint(equalToConstant: 30),
            plusBtn.widthAnchor.constraint(equalToConstant: 30),
            minusBtn.heightAnchor.constraint(equalToConstant: 30),
            minusBtn.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}
