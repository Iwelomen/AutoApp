//
//  BrandCollectionModel.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

class BrandCollectionViewModel {
    let brandName: String
    let productImageURL: String
    var imageData: Data? = nil
    
    init(brandName: String, productImageURL:String){
        self.brandName = brandName
        self.productImageURL = productImageURL
    }
}
