//
//  MediaModel.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

// MARK: - APIResponse
struct MediaResponse: Codable {
    let id: String
    let year: Int
    let mileage: Int
    let marketplacePrice: Int
    let transmission: String
    let interiorColor, engineType: String
    let fuelType: String
    let city: String
    let mileageUnit: String
}
