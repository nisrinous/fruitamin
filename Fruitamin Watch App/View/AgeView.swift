//
//  AgeView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 24/05/24.
//

//
//  AgeView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 24/05/24.
//

import SwiftUI

struct AgeView: View {
    @Binding var selectedAge: Int

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                Spacer()
                Text("What's your age?")
                    .font(.title3)
                    .bold()
                Text("This will help us to adjust your daily needs based on your age.")
                    .font(.footnote)
            
                Picker("Select age", selection: $selectedAge) {
                    ForEach(0 ..< 150) { age in
                        Text("\(age)").tag(age)
                    }
                }
                .frame(height: 40)
                Spacer()
                Spacer()
                Spacer()
//                    NavigationLink("Start!") {
//                        FruitsView()
//                    }
            
            }
        }
    }
}
