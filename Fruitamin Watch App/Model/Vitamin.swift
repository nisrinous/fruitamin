//
//  Vitamin.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 28/05/24.
//

import Foundation

struct Vitamin: Codable {
    let vitaminA: [Int]
    let vitaminB12: [Int]
    let vitaminB6: [Int]
    let vitaminC: [Int]
    let vitaminE: [Int]
    let vitaminK: [Int]
    
    enum CodingKeys: String, CodingKey {
        case vitaminA = "vitamin_a"
        case vitaminB12 = "vitamin_b12"
        case vitaminB6 = "vitamin_b6"
        case vitaminC = "vitamin_c"
        case vitaminE = "vitamin_e"
        case vitaminK = "vitamin_k"
    }
}

struct VitaminsData: Codable {
    let category1: Vitamin
    let category2: Vitamin
    let category3: Vitamin
    let category4: Vitamin
    let category5: Vitamin
    let category6: Vitamin
    let category7: Vitamin
    let category8: Vitamin
}
