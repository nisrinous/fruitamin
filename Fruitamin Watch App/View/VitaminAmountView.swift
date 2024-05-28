//
//  VitaminAmountView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 28/05/24.
//

import SwiftUI

struct VitaminAmountView: View {
    var amount: Double
    var vitamin: String
    
    var body: some View {
        if amount > 0 {
            HStack() {
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
            Divider()
            Spacer()
        }
        
    }
}
