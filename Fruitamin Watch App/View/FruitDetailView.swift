//
//  FruitDetailView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 21/05/24.
//
//
//  FruitDetailView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 21/05/24.
//

import SwiftUI

struct FruitDetailView: View {
    let fruit: Fruit
    var creationDate: Date?

    @ObservedObject var userViewModel: UserViewModel
    @State var numberOfFruit: Int = 0
    @State var showSheet: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack() {
                    HStack(alignment: .top) {
                        Image(fruit.name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 35)
                    }
                    Spacer()
                    Spacer()
                    Text(fruit.name.capitalized)
                        .font(.headline)
                        .bold()
                    VStack {
                        Stepper(value: $numberOfFruit,
                                in: (0...99),
                                step: 1
                        ) {
                            Text("\(numberOfFruit)")
                        }
                        .padding(.vertical, 0)
                    }
                    .padding(.horizontal, 17)
                    Button {
                        addVitamins()
                        showSheet = true
                        numberOfFruit = 0
                    } label: {
                        Text("Add")
                    }
                    .disabled(numberOfFruit < 1)
                }
                Spacer()
                Spacer()
                Spacer()

                Divider()

                FruitsVitaminAmountView(amount: fruit.vitaminA, vitamin: "A")
                FruitsVitaminAmountView(amount: fruit.vitaminB6, vitamin: "B6")
                FruitsVitaminAmountView(amount: fruit.vitaminB12, vitamin: "B12")
                FruitsVitaminAmountView(amount: fruit.vitaminC, vitamin: "C")
                FruitsVitaminAmountView(amount: fruit.vitaminE, vitamin: "E")
                FruitsVitaminAmountView(amount: fruit.vitaminK, vitamin: "K")
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 55)
                    .padding(.vertical, 5)
                    .foregroundStyle(Color("greeny"))
                Text("\(fruit.name.capitalized) added!")
                    .bold()
            }
        }
    }
    
    private func addVitamins() {
        print("addvit")
        userViewModel.updateVitaminConsumption(vitamin: "A", amount: fruit.vitaminA * Double(numberOfFruit))
        userViewModel.updateVitaminConsumption(vitamin: "B6", amount: fruit.vitaminB6 * Double(numberOfFruit))
        userViewModel.updateVitaminConsumption(vitamin: "B12", amount: fruit.vitaminB12 * Double(numberOfFruit))
        userViewModel.updateVitaminConsumption(vitamin: "C", amount: fruit.vitaminC * Double(numberOfFruit))
        userViewModel.updateVitaminConsumption(vitamin: "E", amount: fruit.vitaminE * Double(numberOfFruit))
        userViewModel.updateVitaminConsumption(vitamin: "K", amount: fruit.vitaminK * Double(numberOfFruit))
    }
}
