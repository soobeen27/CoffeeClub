//
//  CoffeeCollectionViewCell.swift
//  coffee
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit
import SnapKit

class CoffeeCollectionViewCell: UICollectionViewCell {
    var coffeeClubList: CoffeeClubList? {
        didSet {
            guard let coffee = coffeeClubList else { return }
            coffeeImage.image = UIImage(named: coffee.imageName)
            menuNameLabel.text = coffee.menuName
            menuPriceLabel.text = coffee.menuPrice.numberFormat()
        }
    }
    
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
        delegate?.didTapCoffeeImage(coffeeClubList: coffeeClubList!)
    }
    
    func setLabels() {
        //커피 사진
        coffeeImage = UIImageView()
        coffeeImage.contentMode = .scaleAspectFill

        //커피 이름
        menuNameLabel = UILabel()
        menuNameLabel.textAlignment = .left
        menuNameLabel.textColor = .darkGray
        menuNameLabel.font = .systemFont(ofSize: 15, weight: .regular)
        menuNameLabel.numberOfLines = 0

        //커피 가격
        menuPriceLabel = UILabel()
        menuPriceLabel.textAlignment = .left
        menuPriceLabel.textColor = UIColor(hex: "#4b4b4b")
        menuPriceLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    func setLayout() {
        [coffeeImage, menuNameLabel, menuPriceLabel].forEach {
            self.contentView.addSubview($0)
        }
        coffeeImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(self.frame.width * 0.8)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(coffeeImage.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        coffeeImage.layer.cornerRadius = 10
        coffeeImage.clipsToBounds = true
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 10
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
        cellShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func cellShadow() {
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius)
        self.layer.shadowPath = shadowPath.cgPath
    }
}




