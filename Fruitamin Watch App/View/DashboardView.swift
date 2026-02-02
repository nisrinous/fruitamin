//
//  DashboardView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 26/05/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: UserViewModel

    let category: String
    var vitamin = VitaminsViewModel()

    var vitamins: [(name: String, consumed: Int, dailyNeed: Int)] {
        
        guard let categoryData = vitamin.vitamins[category] else {
            return []
        }
        
        return [
            ("A", viewModel.user.consumedVitaminA, categoryData.vitaminA[viewModel.userGender == "Male" ? 0 : 1]),
            ("B6", viewModel.user.consumedVitaminB6, categoryData.vitaminB6[viewModel.userGender == "Male" ? 0 : 1]),
            ("B12", viewModel.user.consumedVitaminB12, categoryData.vitaminB12[viewModel.userGender == "Male" ? 0 : 1]),
            ("C", viewModel.user.consumedVitaminC, categoryData.vitaminC[viewModel.userGender == "Male" ? 0 : 1]),
            ("E", viewModel.user.consumedVitaminE, categoryData.vitaminE[viewModel.userGender == "Male" ? 0 : 1]),
            ("K", viewModel.user.consumedVitaminK, categoryData.vitaminK[viewModel.userGender == "Male" ? 0 : 1])
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
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Fruitamin")
                        .foregroundStyle(Color("greeny"))
                    
                }

            }
        }
        .navigationBarBackButtonHidden()
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
    
    let contentView = ContentView()
    DashboardView(viewModel: viewModel, category: contentView.defineUserCategory())
}
