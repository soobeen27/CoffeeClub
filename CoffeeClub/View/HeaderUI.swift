//
//  HeaderUI.swift
//  coffeeClub
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit

class HeaderUI: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupHeader() {
        // 상단 로고 이미지 뷰
        let logoLabel = UILabel()
        logoLabel.text = "CoffeeClub"
        logoLabel.textAlignment = .center
        logoLabel.textColor = .white
        logoLabel.backgroundColor = .black
        logoLabel.font = UIFont(name: "VITRO CORE TTF", size: 30)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
    
        // 탭 메뉴 버튼들
        let tabButton1 = UILabel()
        tabButton1.text = "tab1"
        tabButton1.textColor = .white
        
        let tabButton2 = UILabel()
        tabButton2.text = "tab2"
        tabButton2.textColor = .white
        
        let tabButton3 = UILabel()
        tabButton3.text = "tab3"
        tabButton3.textColor = .white
        
        // 스택 뷰에 버튼 추가
        let stackView = UIStackView(arrangedSubviews: [tabButton1, tabButton2, tabButton3])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 헤더 뷰 생성
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(logoLabel)
        headerView.addSubview(stackView)
        headerView.backgroundColor = .black
        
        // 헤더 뷰를 메인 뷰에 추가
        self.addSubview(headerView)
        
        // 오토레이아웃 제약 조건 설정
        NSLayoutConstraint.activate([
            // 헤더 뷰
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // 로고 위치
            logoLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 50),
            logoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // 스택 뷰
            stackView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            
            // 헤더 뷰 높이
            headerView.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    
    }

}
