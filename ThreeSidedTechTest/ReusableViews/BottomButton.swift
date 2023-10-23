//
//  BottomButton.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

struct BottomButton: View {
    
    var title: String
    
    var body: some View {
        VStack {
            Button(action: {
            }) {
                Text(title)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .padding(.all, 30)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(
            Color.white
                .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                .mask(Rectangle().padding(.top, -20))
        )
    }
}
