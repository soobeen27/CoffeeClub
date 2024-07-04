//
//  CoffeeCollectionViewCell.swift
//  coffee
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit
import SnapKit

class CoffeeCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CoffeeCollectionViewCellDelegate?
    var coffeeImage: UIImageView!
    var menuNameLabel: UILabel!
    var menuPriceLabel: UILabel!
    var index: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabels()
        setLayout()
        
        //커피 이미지 탭을 감지하여 제스처 인식기
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCoffeeTap))
        coffeeImage.isUserInteractionEnabled = true
        coffeeImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func handleCoffeeTap() {
        delegate?.didTapCoffeeImage(at: index)
    }
    
    func setLabels() {
        //커피 사진
        coffeeImage = UIImageView()
        coffeeImage.image = UIImage(named: "coffee1")
        coffeeImage.contentMode = .scaleAspectFill

        //커피 이름
        menuNameLabel = UILabel()
        menuNameLabel.textAlignment = .center
        menuNameLabel.textColor = .black
        menuNameLabel.font = UIFont(name: coffeeFontName, size: 15)

        //커피 가격
        menuPriceLabel = UILabel()
        menuPriceLabel.textAlignment = .center
        menuNameLabel.textColor = .black
        menuPriceLabel.font = UIFont(name: coffeeFontName, size: 18)
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
        coffeeImage.image = UIImage(named: coffee.imageName)
    }
}




