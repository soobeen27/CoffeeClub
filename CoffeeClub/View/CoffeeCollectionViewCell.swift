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
    }
    
    func setLabels() {
        //커피 사진
        coffeeImage = UIImageView()
        coffeeImage.image = UIImage(named: "coffee1")
        coffeeImage.contentMode = .scaleAspectFill

        //커피 이름
        menuNameLabel = UILabel()
        menuNameLabel.textAlignment = .center

        //커피 가격
        menuPriceLabel = UILabel()
        menuPriceLabel.textAlignment = .center
    }
    
    func setLayout() {
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




