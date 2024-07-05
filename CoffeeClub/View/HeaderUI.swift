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
        setupButtons()
        setupHeader()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            setupConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader() {
        backgroundColor = UIColor(hex: "#cd2323")
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoLabel)
        addSubview(stackView)
        addSubview(searchBar)
    }
    
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.searchTextField.backgroundColor = .white
        bar.searchTextField.textColor = .black
        bar.searchBarStyle = .minimal
        bar.searchTextField.layer.cornerRadius = 10
        bar.searchTextField.layer.masksToBounds = true
        bar.layer.backgroundColor = UIColor(hex: "#cd2323").cgColor
        if let textField = bar.value(forKey: "searchField") as? UITextField {
            textField.attributedPlaceholder = NSAttributedString(string: "메뉴를 검색해보세요", attributes: [.foregroundColor: UIColor.lightGray])
        }
        return bar
    }()
    
    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "CoffeeClub"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(hex: "#cd2323")
        label.font = UIFont(name: logoFontName, size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 10
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = UIColor(hex: "#f4f0ed")
        return stack
    }()
    
    private func setupButtons() {
        let titles = ["모두", "커피", "디카페인", "디저트"]
        for (index, title) in titles.enumerated() {
            let button = createButton(title: title, tag: index + 1)
            buttons.append(button)
        }
    }
    
    private func createButton(title: String, tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tag = tag
        button.layer.cornerRadius = 5
        button.addTarget(categoriseChangeButton, action: #selector(CategoriseChangeButton.buttonTapped(_:)), for: .touchDown)
        return button
    }
    
    // ------------------- MARK: AutoLayout 설정 -------------------
    private func setupConstraints() {
        guard let superview = superview else { return }
        
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        

        
        buttons.first?.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
        }
        
        buttons.last?.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // 카테고리 버튼을 눌렀을 때 버튼 색상이 바뀌는 메서드
    func thisButtonTap(selectedButton: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.buttons.forEach {
                let isSeleted = $0 == selectedButton
                $0.backgroundColor = isSeleted ? UIColor(hex: "#e4e4e4") : .white
                $0.setTitleColor(UIColor(hex: isSeleted ? "#222222" : "#333333"), for: .normal)
            }
        }
    }
}
