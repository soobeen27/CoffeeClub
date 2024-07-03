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
            itemName.text = "\(receipt.menuName) × \(receipt.amount)"
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
        label.font = .systemFont(ofSize: 16)
        label.textColor = modalColor.text
        label.textAlignment = .right
        return label
    }()
    
    let itemPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = modalColor.text
        label.textAlignment = .right
        return label
    }()
    
    lazy var horizontalItemStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [itemName ,stepAmount,itemPrice])
        stv.axis = .horizontal
        stv.spacing = 24
        stv.alignment = .trailing
        stv.distribution = .fill
        return stv
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
        self.contentView.addSubview(horizontalItemStackView)
        
        horizontalItemStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
            $0.height.equalTo(stepAmount.snp.height)
        }
        itemPrice.snp.makeConstraints {
            $0.width.equalTo(self.frame.width / 4)
            $0.height.equalTo(stepAmount.snp.height)
        }
        itemName.snp.makeConstraints {
            $0.height.equalTo(stepAmount.snp.height)
        }
        stepAmount.snp.makeConstraints {
            $0.width.equalTo(self.frame.width / 4)
            
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
        btn.setTitleColor(textColor, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    lazy var minusBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    private let numLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    lazy var hSV: UIStackView = {
        let st = UIStackView(arrangedSubviews: [minusBtn, numLabel, plusBtn])
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .center
        st.spacing = 4
        return st
    }()
    init() {
        self.value = 0
        self.textColor = .white
        super.init(frame: .zero)
        setLayout()
        minusBtn.addAction(UIAction { _ in
            self.value -= 1
        }, for: .touchDown)
        plusBtn.addAction(UIAction { _ in
            self.value += 1
        }, for: .touchDown)
    }
    init(value: Int, color: UIColor) {
        self.value = value
        self.textColor = color
        super.init(frame: .zero)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setLayout() {
        self.backgroundColor = .blue
        hSV.translatesAutoresizingMaskIntoConstraints = false
        minusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hSV)
        NSLayoutConstraint.activate([
            hSV.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            hSV.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            hSV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            hSV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}
