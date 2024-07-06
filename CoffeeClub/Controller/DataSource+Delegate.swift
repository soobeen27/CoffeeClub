//
//  DataSource+Delegate.swift
//  CoffeeClub
//
//  Created by 임혜정 on 7/6/24.
//

import UIKit

// MARK: - 메인 메뉴 리스트 관련
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCoffeeList.isEmpty ? menuList.count : filteredCoffeeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeCollectionViewCell", for: indexPath) as! CoffeeCollectionViewCell
        let coffee = filteredCoffeeList.isEmpty ? menuList[indexPath.row] : filteredCoffeeList[indexPath.row]
        cell.coffeeClubList = coffee
        cell.delegate = self
        cell.index = indexPath.row
        cell.indexPath = indexPath
        return cell
    }
}

// 리스트 레이아웃
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

// MARK: - 장바구니 카운팅과 그에 따른 애니메이션 적용
extension ViewController: CoffeeCollectionViewCellDelegate {
    func didTapCoffeeImage(coffeeClubList: CoffeeClubList, at indexPath: IndexPath) {
        guard let cell = coffeeCollectionView.cellForItem(at: indexPath) as? CoffeeCollectionViewCell else { return }
        
        // 스냅샷 생성
        let cellSnapshot = snapshotOfCell(inputView: cell)
        guard let window = getActiveWindow() else { return }
        cellSnapshot.center = window.convert(cell.center, from: coffeeCollectionView)
        window.addSubview(cellSnapshot)
        
        let cartButtonFrame = orderButton.frame
        let targetCenter = window.convert(CGPoint(x: cartButtonFrame.midX, y: cartButtonFrame.midY), from: orderButton.superview)
        
        // 애니메이션 실행
        UIView.animate(withDuration: 0.5, animations: {
            cellSnapshot.center = targetCenter
            cellSnapshot.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            cellSnapshot.alpha = 0.0
        }, completion: { _ in
            cellSnapshot.removeFromSuperview()
            self.coffeeList.addShopingList(coffeeClubList: coffeeClubList)
            self.orderCount = self.coffeeList.getAmount()
        })
    }
    
    func snapshotOfCell(inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.applyShadow()
        return cellSnapshot
    }
}
