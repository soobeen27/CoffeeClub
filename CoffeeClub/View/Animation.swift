//
//  Animation.swift
//  CoffeeClub
//
//  Created by 임혜정 on 7/6/24.
//

import UIKit


// MARK: - 애니메이션 관련
extension UIViewController {
    func animateCollectionViewCells(in collectionView: UICollectionView) {
        let cells = collectionView.visibleCells
        let collectionViewHeight = collectionView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: collectionViewHeight)
            cell.alpha = 0
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(delayCounter), usingSpringWithDamping: 0.6, initialSpringVelocity: 1.0, options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: -10) // 튀어오르는 효과를 위해 조금 더 위로 설정
                cell.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, animations: {
                    cell.transform = CGAffineTransform.identity // 원래 위치로 떨어지게 함
                })
            })
            delayCounter += 1
        }
    }
}

extension ViewController {
    func animateCollectionViewTransition(to newMenuList: [CoffeeClubList]) {
        let transition = CATransition()
        transition.type = .push
        transition.subtype = .fromRight
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        coffeeCollectionView.layer.add(transition, forKey: nil)
        
        menuList = newMenuList
        coffeeCollectionView.reloadData()
    }
}
