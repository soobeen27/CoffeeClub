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
    let orderButton = UIButton(type: .system)
    var headerView = HeaderUI()
    var orderCount: Int = 0 {
        didSet {
            orderButton.setTitle("주문하기(\(orderCount))", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupOrderArea()
        setLayout()
    }
    
    func setupOrderArea() {
        // 아래 주문 버튼 영역
        orderButton.setTitle("주문하기\(orderCount)", for: .normal)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        orderButton.backgroundColor = .black
        orderButton.setTitleColor(.white, for: .normal)

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
        coffeeCollectionView.backgroundColor = .white
        coffeeCollectionView.dataSource = self
        coffeeCollectionView.delegate = self

        // 컬렉션뷰 셀 등록
        coffeeCollectionView.register(CoffeeCollectionViewCell.self, forCellWithReuseIdentifier: "CoffeeCollectionViewCell")
        
        // 탭 제스처 추가
        coffeeCollectionView.isUserInteractionEnabled = true // 터치 이벤트 활성화
        let detailPage = UITapGestureRecognizer(target: self, action: #selector(collectionViewTapped))
        coffeeCollectionView.addGestureRecognizer(detailPage)
    }
    
    @objc private func collectionViewTapped() {
        // 모달 뷰컨트롤러 생성 및 설정
        let modalVC = DetailPage()
        modalVC.modalPresentationStyle = .custom
        present(modalVC, animated: true, completion: nil)
    }
    
    // MARK: 오토레이아웃은 모아서!
    func setLayout() {
        [headerView, orderButton, coffeeCollectionView].forEach {
            self.view.addSubview($0)
        }

        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        orderButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.height.equalTo(50)
        }

        coffeeCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom).offset(10)
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
        print("order Count: \(orderCount)")
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


