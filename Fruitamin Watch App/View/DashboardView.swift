//
//  DashboardView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 26/05/24.
//
import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: UserViewModel

    let userAge: Int
    let userGender: String
    let category: String
    var vitamin = VitaminsViewModel()

    var vitamins: [(name: String, consumed: Int, dailyNeed: Int)] {
            [
                ("A", viewModel.user.consumedVitaminA, vitamin.vitamins[category]!.vitaminA[userGender == "Male" ? 0 : 1]),
                ("B6", viewModel.user.consumedVitaminB6, vitamin.vitamins[category]!.vitaminB6[userGender == "Male" ? 0 : 1]),
                ("B12", viewModel.user.consumedVitaminB12, vitamin.vitamins[category]!.vitaminB12[userGender == "Male" ? 0 : 1]),
                ("C", viewModel.user.consumedVitaminC, vitamin.vitamins[category]!.vitaminC[userGender == "Male" ? 0 : 1]),
                ("E", viewModel.user.consumedVitaminE, vitamin.vitamins[category]!.vitaminE[userGender == "Male" ? 0 : 1]),
                ("K", viewModel.user.consumedVitaminK, vitamin.vitamins[category]!.vitaminK[userGender == "Male" ? 0 : 1])
            ]
        }

    var body: some View {
        NavigationStack {
            HStack {
                Text("Today")
                    .font(.headline)
                    .foregroundStyle(Color("purply"))
                Spacer()
            }
            List(vitamins, id: \.name) { vitamin in UsersVitaminAmountView(vitamin: vitamin.name, consumedAmount: vitamin.consumed, dailyNeedAmount: vitamin.dailyNeed)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        FruitsView(userViewModel: viewModel)
                    } label: {
                        Image(systemName:"plus")

                    }
                }
            }
        }
        .navigationTitle {
            Text("Fruitamin")
                .foregroundStyle(Color("greeny"))
        }
        .navigationBarBackButtonHidden()
    }
}
