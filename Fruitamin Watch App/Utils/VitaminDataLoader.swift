//
//  VitaminDataLoader.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 28/05/24.
//

import Foundation

func loadVitaminsData() -> VitaminsData? {
    guard let url = Bundle.main.url(forResource: "vitamins", withExtension: "json") else {
        print("JSON file not found")
        return nil
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let vitaminsData = try decoder.decode(VitaminsData.self, from: data)
        return vitaminsData
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}
