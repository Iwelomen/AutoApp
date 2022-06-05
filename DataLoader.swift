//
//  DataLoader.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import Foundation

class DataLoader {
    
    static let shared = DataLoader()
    
    //MARK: - Method to get current weather data from API
    public func pullJSONData(completionHandler: @escaping (PopularCarModel) -> ()) {
        let url = "https://api-prod.autochek.africa/v1/inventory/make?popular=true"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(PopularCarModel.self, from: data)
                        print("Here is the data")
                        print(json)
                        completionHandler(json)
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
    public func pullListJSONData(completionHandler: @escaping (CarsListModel) -> ()) {
        let url = "https://api-prod.autochek.africa/v1/inventory/car/search"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(CarsListModel.self, from: data)
                        print("Here is the data")
                        print(json)
                        completionHandler(json)
                    } catch {
                        print("\(error)")
                    }
                }
            }.resume()
        }
    }
    public func pullDetailJSONData(completionHandler: @escaping (CarDetails) -> ()) {
        let url = "https://api-prod.autochek.africa/v1/inventory/car/pgHpI6GIH"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(CarDetails.self, from: data)
                        print("Here is the data")
                        print(json)
                        completionHandler(json)
                    } catch {
                        print("\(error)")
                    }
                }
            }.resume()
        }
    }
}
