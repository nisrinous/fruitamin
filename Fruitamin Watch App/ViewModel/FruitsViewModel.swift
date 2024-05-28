//
//  FruitsViewModel.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 21/05/24.
//

import Foundation

class FruitsViewModel: ObservableObject {
    @Published var fruits: [String: Fruit] = [:]

    init() {
        loadFruitData()
    }

    func loadFruitData() {
        if let fruitsData = loadFruitsData() {
            self.fruits = [
                "apple": fruitsData.apple,
                "avocado": fruitsData.avocado,
                "banana": fruitsData.banana,
                "carrot": fruitsData.carrot,
                "orange": fruitsData.orange,
                "peach": fruitsData.peach,
                "strawberry": fruitsData.strawberry
            ]
        }
    }
}
