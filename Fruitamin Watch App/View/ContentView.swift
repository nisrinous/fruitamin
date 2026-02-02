//
//  ContentView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel(user: User(
        name: "",
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
    ), userAge: 0, userGender: "Male")

    func defineUserCategory() -> String {
        switch viewModel.userAge {
        case 1..<3:
            return "category2"
        case 3..<7:
            return "category3"
        case 7..<13:
            return "category4"
        case 13..<18:
            return "category5"
        case 18..<30:
            return "category6"
        case 30..<60:
            return "category7"
        case 60...:
            return "category8"
        default:
            return "category1"
        }
    }


    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink("Select age") {
                        AgeView(selectedAge: $viewModel.userAge)
                    }
                    NavigationLink("Select gender") {
                        GenderView(selectedGender: $viewModel.userGender)

                    }
                    Spacer()
                    Spacer()
                    NavigationLink("Start!") {
                        DashboardView(viewModel: viewModel, category: defineUserCategory())
                    }
                    .disabled(viewModel.userAge < 1 || viewModel.userGender.isEmpty)
                    .foregroundStyle(Color("greeny"))
                    .bold()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Fruitamin")
                        .foregroundStyle(Color("purply"))
                    
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel = UserViewModel(user: User(
        name: "",
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
    ), userAge: 0, userGender: "Male")
    
    ContentView(viewModel: viewModel)
}
