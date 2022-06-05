//
//  CarListModel.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

// MARK: - Welcome
struct CarsListModel: Codable {
    let result: [Result]
    let pagination: Paginations
}

// MARK: - Pagination
struct Paginations: Codable {
    let total, currentPage, pageSize: Int
}

// MARK: - Result
struct Result: Codable {
    let id, title: String
    let imageUrl: String
    let year: Int
    let city, state: String
    let sellingCondition: String?
    let hasWarranty: Bool
    let marketplacePrice, marketplaceOldPrice: Int
    let hasFinancing: Bool
    let mileage: Int
    let mileageUnit: String
    let installment: Int
    let depositReceived: Bool
    let loanValue: Int
    let websiteUrl: String
    let stats: Stats
    let bodyTypeId: String
    let sold, hasThreeDImage: Bool
}

// MARK: - Stats
struct Stats: Codable {
    let webViewCount, webViewerCount, interestCount, testDriveCount: Int
    let appViewCount, appViewerCount, processedLoanCount: Int
}
