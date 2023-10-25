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
            Button {
                self.btnAction()
            } label: {
                Text(title)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(isPlain ?? false ? .white : .black)
            .modifier(TextModifier.PoppinsBold14x())
            .foregroundColor(isPlain ?? false ? .black : .white)
            .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.black, lineWidth: 1.5))
        }
    }
}
