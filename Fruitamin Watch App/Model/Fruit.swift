//
//  Fruit.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 21/05/24.
//

import Foundation

struct Fruit: Codable {
    let name: String
    let description: String
    let vitaminA: Double
    let vitaminB12: Double
    let vitaminB6: Double
    let vitaminC: Double
    let vitaminE: Double
    let vitaminK: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case vitaminA = "vitamin_a"
        case vitaminB12 = "vitamin_b12"
        case vitaminB6 = "vitamin_b6"
        case vitaminC = "vitamin_c"
        case vitaminE = "vitamin_e"
        case vitaminK = "vitamin_k"
    }
}

struct FruitsData: Codable {
    let apple: Fruit
    let avocado: Fruit
    let banana: Fruit
    let carrot: Fruit
    let orange: Fruit
    let peach: Fruit
    let strawberry: Fruit
}
