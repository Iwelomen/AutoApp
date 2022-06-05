//
//  PopularCarsModel.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

struct PopularCarModel : Codable {
    let makeList : [MakeList]
    let pagination : Pagination
    
    enum CodingKeys: String, CodingKey {
        case makeList = "makeList"
        case pagination = "pagination"
    }
}
struct MakeList : Codable {
    let id : Int
    let name : String
    let imageUrl : String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case imageUrl = "imageUrl"
    }
}

struct Pagination : Codable {
    let total : Int
    let currentPage : Int
    let pageSize : Int
    
    enum CodingKeys: String, CodingKey {
        
        case total = "total"
        case currentPage = "currentPage"
        case pageSize = "pageSize"
    }
}
