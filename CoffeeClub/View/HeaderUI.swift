//
//  HeaderUI.swift
//  coffeeClub
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit

class HeaderUI: UIView {
    var categoriseChangeButton: CategoriseChangeButton?
    
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
        
        // 서치바
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.searchBarStyle = .minimal // 선택적으로 검색바 스타일 설정
        searchBar.backgroundColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
    
        // 탭 메뉴 버튼들
        let tabButton1 = UIButton(type: .system)
        tabButton1.setTitle("커피", for: .normal)
        tabButton1.setTitleColor(.white, for: .normal)
        tabButton1.backgroundColor = .black
        tabButton1.tag = 1
        tabButton1.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
        let tabButton2 = UIButton(type: .system)
        tabButton2.setTitle("디카페인", for: .normal)
        tabButton2.setTitleColor(.white, for: .normal)
        tabButton2.backgroundColor = .black
        tabButton2.tag = 2
        tabButton2.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
        let tabButton3 = UIButton(type: .system)
        tabButton3.setTitle("디저트", for: .normal)
        tabButton3.setTitleColor(.white, for: .normal)
        tabButton3.backgroundColor = .black
        tabButton3.tag = 3
        tabButton3.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
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
        headerView.addSubview(searchBar)
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
            logoLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 40),
            logoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // 서치바 위치
            searchBar.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // 스택 뷰
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            
            // 헤더 뷰 높이
            headerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    
    }

}
