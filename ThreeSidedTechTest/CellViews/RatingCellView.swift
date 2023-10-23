//
//  RatingCellView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

struct RatingCellView: View {

    var imgIcon: String
    var text: String
    var isSelected: Bool
    var body: some View {

        HStack {
            Image(imgIcon)
                .resizable()
                .frame(width: 25, height: 25)
            Text(text)
                .modifier(TextModifier.PoppinsBold16x())
            Spacer()
            Image(isSelected ?? false  ? "Active" : "Inactive")
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.gray, lineWidth: 1.0))
    }
}
