//
//  ImageHeaderView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct ImageHeaderView: View {
    var title: String
    var image: String

    var body: some View {
        Image(image)
            .resizable()
            .frame(height: 100)
            .scaledToFit()
            .overlay(
                Text(title)
                    .modifier(TextModifier.PoppinsBold24x())
                    .padding()
                , alignment: .leading
            )
            .background(.green)
    }
}
