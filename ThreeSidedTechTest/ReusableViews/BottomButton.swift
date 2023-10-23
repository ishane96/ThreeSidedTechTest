//
//  BottomButton.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

struct BottomButton: View {
    
    var title: String
    var isPlain: Bool?
    var btnAction: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                self.btnAction()
            }) {
                Text(title)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(isPlain ?? false ? .white : .black)
            .padding(.all, 30)
            .foregroundColor(isPlain ?? false ? .black : .white)
        }
    }
}
