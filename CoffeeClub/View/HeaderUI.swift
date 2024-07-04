//
//  HeaderUI.swift
//  coffeeClub
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit

class HeaderUI: UIView {
    var categoriseChangeButton: CategoriseChangeButton?
    var searchBar: UISearchBar!
    var buttons: [UIButton] = []

    
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
        logoLabel.backgroundColor = UIColor(hex: "#cd2323")
        logoLabel.font = UIFont(name: logoFontName, size: 30)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 서치바
        searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchBarStyle = .minimal // 선택적으로 검색바 스타일 설정
        searchBar.layer.backgroundColor = UIColor(hex: "#cd2323").cgColor
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        // 탭 메뉴 버튼들
        let allButton = UIButton(type: .system)
        allButton.setTitle("ALL", for: .normal)
        allButton.setTitleColor(.black, for: .normal)
        allButton.backgroundColor = .red
        allButton.tag = 1
        allButton.layer.cornerRadius = 5
        allButton.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
        let tabButton1 = UIButton(type: .system)
        tabButton1.setTitle("커피", for: .normal)
        tabButton1.setTitleColor(.black, for: .normal)
        tabButton1.backgroundColor = .white
        tabButton1.tag = 2
        tabButton1.layer.cornerRadius = 5
        tabButton1.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
        let tabButton2 = UIButton(type: .system)
        tabButton2.setTitle("디카페인", for: .normal)
        tabButton2.setTitleColor(.black, for: .normal)
        tabButton2.backgroundColor = .white
        tabButton2.tag = 3
        tabButton2.layer.cornerRadius = 5
        tabButton2.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
        let tabButton3 = UIButton(type: .system)
        tabButton3.setTitle("디저트", for: .normal)
        tabButton3.setTitleColor(.black, for: .normal)
        tabButton3.backgroundColor = .white
        tabButton3.tag = 4
        tabButton3.layer.cornerRadius = 5
        tabButton3.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        
        buttons = [allButton, tabButton1, tabButton2, tabButton3]
        
        // 스택 뷰에 버튼 추가
        let stackView = UIStackView(arrangedSubviews: [allButton, tabButton1, tabButton2, tabButton3])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(hex: "#cd2323")
        
        // 헤더 뷰 생성
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(logoLabel)
        headerView.addSubview(stackView)
        headerView.addSubview(searchBar)
        headerView.backgroundColor = UIColor(hex: "#cd2323")
        
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
            logoLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // 서치바 위치
            searchBar.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // 버튼 위치 설정 (예시로 첫 번째와 마지막 버튼만 설정)
            allButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tabButton3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            // 스택 뷰
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            
            // 헤더 뷰 높이 설정
            headerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }    
    // 카테고리 버튼을 눌렀을 때 버튼 색상이 바뀌는 메서드
    func thisButtonTap(selectedButton: UIButton) {
        for button in buttons {
            button.backgroundColor = (button == selectedButton) ? .red : .white
        }
    }
}
