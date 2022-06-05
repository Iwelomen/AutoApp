//
//  CarDetailsModel.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

// MARK: - Welcome
struct CarDetails: Codable {
    let error: String
    let code: Int
    let message: String
    let details: [Detail]
}

// MARK: - Detail
struct Detail: Codable {
    let value: String
}
