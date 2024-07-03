//
//  CoffeeCollectionViewCell.swift
//  coffee
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit
import SnapKit

class CoffeeCollectionViewCell: UICollectionViewCell {
    
    var coffeeImage: UIImageView!
    var menuNameLabel: UILabel!
    var menuPriceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabels()
        setLayout()
        // MARK: init이 터질꺼같아요
        //커피 사진
//        coffeeImage = UIImageView()
//        coffeeImage.image = UIImage(named: "coffee1")
//        coffeeImage.contentMode = .scaleAspectFill
//        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(coffeeImage)
//        //커피 이름
//        menuNameLabel = UILabel()
//        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        menuNameLabel.textAlignment = .center
//        self.contentView.addSubview(menuNameLabel)
//        //커피 가격
//        menuPriceLabel = UILabel()
//        menuPriceLabel.translatesAutoresizingMaskIntoConstraints = false
//        menuPriceLabel.textAlignment = .center
//        self.contentView.addSubview(menuPriceLabel)
        
//        NSLayoutConstraint.activate([
//            coffeeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
//            coffeeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            coffeeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            coffeeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
//            
//            menuNameLabel.topAnchor.constraint(equalTo: coffeeImage.bottomAnchor, constant: 16),
//            menuNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            menuNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            
//            menuPriceLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: 3),
//            menuPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            menuPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            menuPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ])
//        
//        self.contentView.layer.borderWidth = 1
    }
    func setLabels() {
        //커피 사진
        coffeeImage = UIImageView()
        coffeeImage.image = UIImage(named: "coffee1")
        coffeeImage.contentMode = .scaleAspectFill
//        coffeeImage.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(coffeeImage)
        //커피 이름
        menuNameLabel = UILabel()
//        menuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        menuNameLabel.textAlignment = .center
//        self.contentView.addSubview(menuNameLabel)
        //커피 가격
        menuPriceLabel = UILabel()
//        menuPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        menuPriceLabel.textAlignment = .center
//        self.contentView.addSubview(menuPriceLabel)
    }
    
    func setLayout() {
//        NSLayoutConstraint.activate([
//            coffeeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
//            coffeeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            coffeeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            coffeeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
//            
//            menuNameLabel.topAnchor.constraint(equalTo: coffeeImage.bottomAnchor, constant: 16),
//            menuNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            menuNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            
//            menuPriceLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: 3),
//            menuPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            menuPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            menuPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ])
        [coffeeImage, menuNameLabel, menuPriceLabel].forEach {
            self.contentView.addSubview($0)
        }
        coffeeImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(self.frame.height * 0.6)
        }
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(coffeeImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(3)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        
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




