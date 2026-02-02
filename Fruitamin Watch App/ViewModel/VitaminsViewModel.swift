//
//  VitaminsViewModel.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 28/05/24.
//

import Foundation

class VitaminsViewModel: ObservableObject {
    @Published var vitamins: [String: Vitamin] = [:]

    init() {
        loadVitaminData()
    }

    func loadVitaminData() {
        if let vitaminsData = loadVitaminsData() {
            print("Loaded vitamins data: \(vitaminsData)")
            self.vitamins = [
                "category1": vitaminsData.category1,
                "category2": vitaminsData.category2,
                "category3": vitaminsData.category3,
                "category4": vitaminsData.category4,
                "category5": vitaminsData.category5,
                "category6": vitaminsData.category6,
                "category7": vitaminsData.category7,
                "category8": vitaminsData.category8
            ]
        } else {
            print("Failed to load vitamins data.")
        }
    }
}
