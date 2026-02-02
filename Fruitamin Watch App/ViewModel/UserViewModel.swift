//
//  UserViewModel.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 26/05/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var user: User
    @Published var userAge: Int
    @Published var userGender: String

    init(user: User, userAge: Int, userGender: String) {
        self.user = user
        self.userAge = userAge
        self.userGender = userGender
    }

    func updateVitaminConsumption(vitamin: String, amount: Double) {
        switch vitamin {
        case "A":
            user.consumedVitaminA += Int(amount)
        case "B6":
            user.consumedVitaminB6 += Int(amount)
        case "B12":
            user.consumedVitaminB12 += Int(amount)
        case "C":
            user.consumedVitaminC += Int(amount)
        case "E":
            user.consumedVitaminE += Int(amount)
        case "K":
            user.consumedVitaminK += Int(amount)
        default:
            break
        }
    }
}
