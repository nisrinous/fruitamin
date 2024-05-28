//
//  VitaminAmountView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 22/05/24.
//

import SwiftUI

struct FruitsVitaminAmountView: View {
    var amount: Double
    var vitamin: String
    
    var body: some View {
        HStack() {
            if amount > 0 {
                Text("Vit \(vitamin)")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .foregroundStyle(Color("orangie"))
                Spacer()
                Text("\(String(Double(amount)).prefix(5)) µg")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        Divider()
        Spacer()
    }
}
