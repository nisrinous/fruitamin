//
//  FruitsView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 17/05/24.
//

import SwiftUI

struct FruitsView: View {
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var viewModel = FruitsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.fruits.keys.sorted(), id: \.self) { key in
                NavigationLink(destination: FruitDetailView(fruit: viewModel.fruits[key]!, userViewModel: userViewModel)) {
                    Image(key)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                    Text(key.capitalized)
                        .font(.caption)
                        .bold()
                }
            }
        }
    }
}
