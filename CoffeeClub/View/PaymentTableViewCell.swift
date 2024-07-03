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
        }
    }
    
    let itemName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()

    let itemPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    lazy var horizontalItemStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [itemName,itemPrice])
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
        self.addSubview(horizontalItemStackView)
        
        horizontalItemStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        itemPrice.snp.makeConstraints {
            $0.width.equalTo(self.frame.width / 4)
        }
    }
}
