//
//  BrandCollectionViewCell.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {

    static let identifier = "BrandCollectionViewCell"
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        return imageView
    }()
    
    let brandName: UILabel = {
        let text = UILabel()
        text.font = UIFont(name: "Helvetica", size: 13)
        text.numberOfLines = 0
        text.text = "Lexus"
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews() {
        addSubview(brandName)
        addSubview(productImageView)
        productImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: brandName.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0)
        productImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        brandName.anchorWithConstantsToTop(top: productImageView.bottomAnchor, left: leftAnchor,
                                           bottom: bottomAnchor,
                                           right: rightAnchor,
                                           topConstant: 70,
                                           leftConstant: 0,
                                           bottomConstant: 0, rightConstant: -10)
        brandName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
    }
    
    public func configure(with viewModel: BrandCollectionViewModel) {
        brandName.text = viewModel.brandName
        let urlString = viewModel.productImageURL
        let url = URL(string: urlString)
        
            URLSession.shared.dataTask(with: url!) { data, _, error in
                guard let data = data, error == nil else { return}
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self.productImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

