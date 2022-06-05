//
//  MainCollectionModel.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

class MainCollectionViewModel {
    let id: String
    let title: String
    let imageURL: String
    var imageData: Data? = nil
    let city: String
    let  mileage, year : Int
    let state, mileageUnit: String
    
    init(id: String,title: String,
         imageURL: String,
         year: Int,
         city: String,
         state: String,
         mileage: Int,
         mileageUnit: String){
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.year = year
        self.city = city
        self.state = state
        self.mileage = mileage
        self.mileageUnit = mileageUnit
    }
}
