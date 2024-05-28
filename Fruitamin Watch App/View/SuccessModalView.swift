//
//  SuccessModalView.swift
//  Fruitamin Watch App
//
//  Created by Nur Nisrina on 27/05/24.
//

import SwiftUI

struct SuccessModalView: View {
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Success!")
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "xmark")
                }
            }
        }
        .background(.white)
        .opacity(0.4)
    }
}

#Preview {
    SuccessModalView()
}
