//
//  ContentView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userAge: Int = 0
    @State private var userGender: String = ""
    @StateObject var viewModel: UserViewModel
    
    init() {
        let user = User(
            name: "",
            age: 0,
            gender: "",
            dailyNeedVitaminA: 0,
            dailyNeedVitaminB6: 0,
            dailyNeedVitaminB12: 0,
            dailyNeedVitaminC: 0,
            dailyNeedVitaminE: 0,
            dailyNeedVitaminK: 0,
            consumedVitaminA: 300,
            consumedVitaminB6: 6,
            consumedVitaminB12: 1,
            consumedVitaminC: 30,
            consumedVitaminE: 5,
            consumedVitaminK: 40
        )
        _viewModel = StateObject(wrappedValue: UserViewModel(user: user))
    }
    
    func defineUserCategory() -> String {
        if userAge == 0 {
            return "category1"
        } else if userAge == 1 {
            return "category2"
        } else if userAge <= 3 {
            return "category3"
        } else if userAge <= 8 {
            return "category4"
        } else if userAge <= 13 {
            return "category5"
        } else if userAge <= 18 {
            return "category6"
        } else if userAge <= 50 {
            return "category7"
        } else {
            return "category8"
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Spacer()
                    Spacer()
                    NavigationLink("Select age") {
                        AgeView(selectedAge: $userAge)
                    }
                    NavigationLink("Select gender") {
                        GenderView(selectedGender: $userGender)
                    }
                    Spacer()
                    Spacer()
                    NavigationLink("Start!") {
                        DashboardView(viewModel: viewModel, userAge: userAge, userGender: userGender, category: defineUserCategory())
                    }
                    .disabled(userAge < 1 && userGender == "")
                    .foregroundStyle(Color("greeny"))
                    .bold()
                }
            }
        }
    }
}
