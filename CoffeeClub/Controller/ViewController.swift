//  ViewController.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    var categoriseChangeButton: CategoriseChangeButton?
    var coffeeCollectionView: UICollectionView!
    let coffeeList = CoffeeClubModel.shared
    var menuList: [CoffeeClubList]!
    let orderButton = UIButton(type: .system)
    var headerView: HeaderUI!
    var orderCount: Int = 0 {
        didSet {
            if orderCount == 0 {
                orderButton.setTitle("주문하기", for: .normal)
            } else {
                orderButton.setTitle("주문하기(\(orderCount))", for: .normal)
            }
        }
    }
    var filteredCoffeeList: [CoffeeClubList] = [] {
        didSet {
            coffeeCollectionView.reloadData()
            animateCollectionViewCells(in: coffeeCollectionView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#f4f0ed")
        setupHeader()
        setupSearchBar()
        setupCollectionView()
        setupOrderArea()
        setLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(updateOrderCount), name: NSNotification.Name("amountChanged"), object: nil)
        updateOrderCount()
        menuList = coffeeList.categories(type: "all")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateOrderCount() {
        orderCount = coffeeList.getAmount()
        hideKeyboard()
    }

    // 카테고리 변경 탭을 헤더 뷰에 연결
    func setupHeader() {
        headerView = HeaderUI(frame: .zero)
        view.addSubview(headerView)
        categoriseChangeButton = CategoriseChangeButton(viewController: self)
        headerView.categoriseChangeButton = categoriseChangeButton 
        headerView.setupHeader()
    }
    
    func setupOrderArea() {
        // 아래 주문 버튼 영역
        orderButton.setTitle("주문하기", for: .normal)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        orderButton.backgroundColor = UIColor(hex: "#cd2323")
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.layer.cornerRadius = 10
        orderButton.addAction(UIAction {_ in
            let nextVC = PaymentVC()
            self.present(nextVC, animated: true)
        }, for: .touchUpInside)
    }
    
    func setupSearchBar() {
        headerView.searchBar.delegate = self
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
        coffeeCollectionView.register(CoffeeCollectionViewCell.self, forCellWithReuseIdentifier: "CoffeeCollectionViewCell")
        view.addSubview(coffeeCollectionView)
    }
    
    // MARK: - Auto Layout
    func setLayout() {
        [headerView, orderButton, coffeeCollectionView].forEach {
            self.view.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180)
        }
        
        orderButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.height.equalTo(50)
        }
        
        coffeeCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(orderButton.snp.top).offset(-10)
        }
    }
    func getActiveWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
    }
}

// MARK: - 서치바 검색어에 따른 필터링
protocol CoffeeCollectionViewCellDelegate: AnyObject {
    func didTapCoffeeImage(coffeeClubList: CoffeeClubList, at indexPath: IndexPath)
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCoffeeList = []
        } else {
            filteredCoffeeList = coffeeList.list.filter { $0.menuName.contains(searchText) }
        }
        animateCollectionViewCells(in: coffeeCollectionView) // 애니메이션 호출
    }
}

// MARK: - 키보드 동작 관련
extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
