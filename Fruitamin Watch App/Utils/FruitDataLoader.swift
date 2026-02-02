//
//  DataLoader.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 21/05/24.
//

import Foundation

func loadFruitsData() -> FruitsData? {
    guard let url = Bundle.main.url(forResource: "fruits", withExtension: "json") else {
        print("JSON file not found")
        return nil
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let fruitsData = try decoder.decode(FruitsData.self, from: data)
        return fruitsData
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}
