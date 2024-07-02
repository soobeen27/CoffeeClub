//
//  ViewController.swift
//  CoffeeClub
//
//  Created by Soo Jang on 7/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var orderBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("주문하기", for: .normal)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        btn.addAction(UIAction {_ in
            let nextVC = PaymentVC()
            self.present(nextVC, animated: true)
        }, for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(orderBtn)
        orderBtn.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

    }
}

#Preview {
    let vc = ViewController()
    return vc
}
