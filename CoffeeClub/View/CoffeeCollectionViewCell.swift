//
//  CoffeeCollectionViewCell.swift
//  coffee
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit

class CoffeeCollectionViewCell: UICollectionViewCell {
    
    var coffeeImage: UIImageView!
    var menuNameLabel: UILabel!
    var menuPriceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //커피 사진
        coffeeImage = UIImageView()
        coffeeImage.image = UIImage(named: "coffee1")
        coffeeImage.contentMode = .scaleAspectFill
        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(coffeeImage)
        //커피 이름
        menuNameLabel = UILabel()
        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        menuNameLabel.textAlignment = .center
        self.contentView.addSubview(menuNameLabel)
        //커피 가격
        menuPriceLabel = UILabel()
        menuPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        menuPriceLabel.textAlignment = .center
        self.contentView.addSubview(menuPriceLabel)
        
        NSLayoutConstraint.activate([
            coffeeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            coffeeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            coffeeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            coffeeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            
            menuNameLabel.topAnchor.constraint(equalTo: coffeeImage.bottomAnchor, constant: 16),
            menuNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            menuPriceLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: 3),
            menuPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            menuPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        self.contentView.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(coffee: CoffeeClubList) {
        menuNameLabel.text = coffee.menuName
        menuPriceLabel.text = coffee.menuPrice.numberFormat()
    }
}




