//
//  UsersVitaminAmountView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 26/05/24.
//

import SwiftUI

struct UsersVitaminAmountView: View {
    var vitamin: String
    var consumedAmount: Int
    var dailyNeedAmount: Int


    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("\(String(consumedAmount))")
                    .font(.title2)
                    .bold()
                Text("/ \(String(dailyNeedAmount))")
                    .font(.title3)
                    .bold()
            }
            Text("Vitamin \(vitamin)")
                .font(.subheadline)
                .foregroundStyle(Color("orangie"))
                .bold()
        }
    }
}
