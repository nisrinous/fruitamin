//
//  GenderView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 22/05/24.
//
//
//  GenderView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 22/05/24.
//

import SwiftUI

struct GenderView: View {
    @Binding var selectedGender: String
    @State var backgroundColorMale: Color = .gray
    @State var backgroundColorFemale: Color = .gray
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                Spacer()
                Text("What's your gender?")
                    .font(.headline)
                    .bold()
                Text("This will help us to adjust your daily needs based on your gender.")
                    .font(.footnote)
                Spacer()
                Spacer()
                Spacer()
                HStack {
                    Button(action: {
                        backgroundColorMale = .cyan
                        backgroundColorFemale = .gray
                        selectedGender = "Male"
                    }, label: {
                        VStack {
                            Image("eggplant")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                            Text("Male")
                                .font(.footnote)
                                .foregroundStyle(.primary)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(backgroundColorMale)
                    Button(action: {
                        backgroundColorFemale = Color("purply")
                        backgroundColorMale = .gray
                        selectedGender = "Female"
                    }, label: {
                        VStack {
                            Image("peach")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                            Text("Female")
                                .font(.footnote)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(backgroundColorFemale)
                }
                Spacer()
                Spacer()
                Spacer()
                    
            }
        }
    }
}

