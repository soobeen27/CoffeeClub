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
    var categoriseChangeButton:CategoriseChangeButton?
    var coffeeCollectionView: UICollectionView!
    var coffeeList: [CoffeeClubList] = CoffeeClubList.list
    let orderButton = UIButton(type: .system)
    var headerView = HeaderUI()
    var orderCount: Int = 0 {
        didSet {
            orderButton.setTitle("주문하기(\(orderCount))", for: .normal)
        }
    }
//    var coffeeClubList: CoffeeClubList? {
//        didSet {
//            guard var coffeeClubList = coffeeClubList else { return }
////            menuNameLabel.text = coffeeClubList.menuName
////            menuPriceLabel.text = coffeeClubList.menuPrice.numberFormat()
////            coffeeImage.image = UIImage(named: coffeeClubList.imageName)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#f4f0ed")
        setupHeader()
        setupCollectionView()
        setupOrderArea()
        setLayout()
    }
    
    func setupHeader() {
        headerView = HeaderUI(frame: .zero)
        view.addSubview(headerView)
        categoriseChangeButton = CategoriseChangeButton(viewController: self)
        headerView.categoriseChangeButton = categoriseChangeButton
        headerView.setupHeader()
    }
    
    func setupOrderArea() {
        // 아래 주문 버튼 영역
        orderButton.setTitle("주문하기\(orderCount)", for: .normal)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        orderButton.backgroundColor = UIColor(hex: "#cd2323")
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.layer.cornerRadius = 10
        orderButton.addAction(UIAction {_ in
            let nextVC = PaymentVC()
            self.present(nextVC, animated: true)
        }, for: .touchUpInside)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        // 컬렉션뷰 생성 및 설정
        coffeeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coffeeCollectionView.backgroundColor = UIColor(hex: "#f4f0ed")
        coffeeCollectionView.dataSource = self
        coffeeCollectionView.delegate = self
        
        // 컬렉션뷰 셀 등록
        coffeeCollectionView.register(CoffeeCollectionViewCell.self, forCellWithReuseIdentifier: "CoffeeCollectionViewCell")
        view.addSubview(coffeeCollectionView)
    }
    
    // MARK: 오토레이아웃은 모아서!
    func setLayout() {
        [headerView, orderButton, coffeeCollectionView].forEach {
            self.view.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(190)
        }
        
        orderButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.height.equalTo(50)
        }
        
        coffeeCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom).offset(25)
            $0.bottom.equalTo(orderButton.snp.top).offset(-10)
        }
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
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
}

extension ViewController: CoffeeCollectionViewCellDelegate {
    func didTapCoffeeImage(at index: Int) {
        orderCount += 1
        CoffeeClubList.list[index].amount += 1
        print("order Count: \(orderCount)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let availableWidth = view.frame.size.width - padding
        let width = availableWidth / 2.24
        return CGSize(width: width, height: width * 1.38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}


