//
//  HeaderUI.swift
//  coffeeClub
//
//  Created by 임혜정 on 7/2/24.
//

import UIKit
import SnapKit

class HeaderUI: UIView {
    var categoriseChangeButton: CategoriseChangeButton?
    var buttons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: 로고,서치바
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "CoffeeClub"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(hex: "#cd2323")
        label.font = UIFont(name: logoFontName, size: 30)
        return label
    }()
    
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchTextField.backgroundColor = .white
        bar.searchTextField.textColor = .black
        bar.searchBarStyle = .minimal
        bar.layer.backgroundColor = UIColor(hex: "#cd2323").cgColor
        bar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        if let textField = bar.value(forKey: "searchField") as? UITextField {
            textField.attributedPlaceholder = NSAttributedString(string: "메뉴를 검색해보세요", attributes: [.foregroundColor: UIColor.lightGray])
            textField.layer.cornerRadius = 15
            textField.layer.masksToBounds = true
        }
        return bar
    }()
    
    // MARK: - 스택뷰와 버튼
    func createButton(_ title: String, _ textColor: String, _ tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(hex: "#f7f7f7")
        button.setTitleColor(UIColor(hex: textColor), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchUpInside)
        button.tag = tag
        if title == "모두" {
            button.titleLabel?.font = .boldSystemFont(ofSize: 15)
            button.layer.borderColor = UIColor(hex: "#cd2323").cgColor
            button.setTitleColor(UIColor(hex: "#cd2323"), for: .normal)
            button.layer.borderWidth = 1
        }
        return button
    }

    func setupHeader() {
        // MARK: - 버튼 생성
        let allButton = createButton("모두", "#cd2323", 1)
        let tabButton1 = createButton("커피", "#333333", 2)
        let tabButton2 = createButton("디카페인", "#333333", 3)
        let tabButton3 = createButton("디저트", "#3333333", 4)
        
        buttons = [allButton, tabButton1, tabButton2, tabButton3]
        
        // MARK: - 버튼 영역 설정
        lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: buttons)
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = 10
            stackView.backgroundColor = UIColor(hex: "#f7f7f7")
            stackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            stackView.isLayoutMarginsRelativeArrangement = true
            return stackView
        }()

        let headerView = UIView()
        headerView.backgroundColor = UIColor(hex: "#cd2323")
        
        // 헤더 뷰를 메인 뷰에 추가
        self.addSubview(headerView)
        headerView.addSubview(logoLabel)
        headerView.addSubview(stackView)
        headerView.addSubview(searchBar)
        
        // MARK: - Auto Layout
        headerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(180)
        }
        
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.height.equalTo(40)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            
        }
        
        buttons.forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(30)
            }
        }
        stackView.addBottomBorder(with: .gray, andWidth: 0.8)
    }

    // MARK: - 카테고리 버튼을 눌렀을 때 버튼 색상이 바뀌는 메서드
    func thisButtonTap(selectedButton: UIButton) {
        UIView.animate(withDuration: 0.1) {
            for button in self.buttons {
                if button == selectedButton {
                    button.setTitleColor(UIColor(hex: "#cd2323"), for: .normal)
                    button.layer.borderWidth = 1
                    button.layer.borderColor = UIColor(hex: "#cd2323").cgColor
                    button.titleLabel?.font = .boldSystemFont(ofSize: 15)
                } else {
            
                    button.setTitleColor(UIColor(hex: "#333333"), for: .normal)
                    button.layer.borderWidth = 0
                    button.titleLabel?.font = .systemFont(ofSize: 15)
                }
            }
        }
    }
    
}


extension UIView {
    func addBottomBorder(with color: UIColor, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(border)
        
        NSLayoutConstraint.activate([
            border.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: borderWidth)
        ])
    }
}
