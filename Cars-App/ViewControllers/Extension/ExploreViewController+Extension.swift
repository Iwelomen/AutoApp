//
//  ExploreViewController+Extension.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation
import UIKit

extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    class LeftPaddedTextField: UITextField {
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
        }
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == brandCollectionView {
            return brandCollectionViewModel.count
        }
        else {
            return mainCollectionViewModel.count
        }
    }
    
    func populateBrandCollectionView() {
        DataLoader.shared.pullJSONData { [weak self] data in
            self?.cars = data.makeList
            self?.brandCollectionViewModel = (self?.cars?.compactMap({
                BrandCollectionViewModel(
                    brandName: $0.name,
                    productImageURL: $0.imageUrl
                )
            }))!
            
            DispatchQueue.main.async {
                self?.brandCollectionView.reloadData()
            }
        }
        
    }
    
    func populateMainCollectionView() {
        DataLoader.shared.pullListJSONData { [weak self] data in
            self?.carsAndDetails = data.result
            self?.mainCollectionViewModel = (self?.carsAndDetails?.compactMap({
                MainCollectionViewModel(
                    id: $0.id,
                    title: $0.title,
                    imageURL: $0.imageUrl,
                    year: $0.year,
                    city: $0.city,
                    state: $0.city,
                    mileage: $0.mileage,
                    mileageUnit: $0.mileageUnit
                )
            }))!
            
            DispatchQueue.main.async {
                self?.mainCollectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == brandCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath) as? BrandCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: brandCollectionViewModel[indexPath.item])
            cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
            cell.layer.cornerRadius = cell.frame.size.height/2
            return cell
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: mainCollectionViewModel[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView  == brandCollectionView {
            return CGSize(width: 50, height: 50)
        } else {
            return CGSize(width: view.frame.width, height: 500)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCollectionView {
            let viewController = ProductDetailsViewController()
            viewController.productName = mainCollectionViewModel[indexPath.row].title
            viewController.id = mainCollectionViewModel[indexPath.row].id
            UserDefaults.standard.set(viewController.id, forKey: "id")
            viewController.configure(with: (mainCollectionViewModel[indexPath.row].imageURL))
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}
