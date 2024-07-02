//
//  ViewController.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//
import UIKit
import SnapKit

#Preview {
    let name = ViewController()
    return name
}

class ViewController: UIViewController {
    
    var coffeeCollectionView: UICollectionView!
    let coffeeList: [CoffeeClubList] = CoffeeClubList.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeader()
        setupCollectionView()
        setupOrderArea()
    }
    
    func setupHeader() {
        let headerView = HeaderUI()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
    func setupOrderArea() {
        // 아래 주문 버튼 영역
        let orderButton = UIButton(type: .system)
        orderButton.setTitle("주문하기", for: .normal)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        orderButton.backgroundColor = .black
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 주문 버튼을 메인 뷰에 추가
        self.view.addSubview(orderButton)
        
        // 오토레이아웃 제약 조건 설정
        NSLayoutConstraint.activate([
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        // 컬렉션뷰 생성 및 설정
        coffeeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coffeeCollectionView.backgroundColor = .white
        coffeeCollectionView.dataSource = self
        coffeeCollectionView.delegate = self
        coffeeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // 컬렉션뷰 셀 등록
        coffeeCollectionView.register(CoffeeCollectionViewCell.self, forCellWithReuseIdentifier: "CoffeeCollectionViewCell")
        
        // 컬렉션뷰를 뷰에 추가
        self.view.addSubview(coffeeCollectionView)
        
        // 오토레이아웃 제약 조건 설정
        NSLayoutConstraint.activate([
            coffeeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            coffeeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coffeeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coffeeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }
    
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffeeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeCollectionViewCell", for: indexPath) as! CoffeeCollectionViewCell
        let coffee = coffeeList[indexPath.row]
        cell.configure(coffee: coffee)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let availableWidth = view.frame.size.width - padding
        let width = availableWidth / 2.24
        
        return CGSize(width: width, height: width * 1.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

    
    
//    lazy var orderBtn: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("주문하기", for: .normal)
//        btn.backgroundColor = .blue
//        btn.setTitleColor(.white, for: .normal)
//        btn.addAction(UIAction {_ in
//            let nextVC = PaymentVC()
//            self.present(nextVC, animated: true)
//        }, for: .touchUpInside)
//        return btn
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        view.addSubview(orderBtn)
//        orderBtn.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
//    }


