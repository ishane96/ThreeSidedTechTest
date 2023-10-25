//
//  TitleAndDescriptionView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct TitleAndDescriptionView: View {
    var title: String
    var descrptn: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
            .modifier(TextModifier.PoppinsBold18x())
            Text(descrptn)
            .modifier(TextModifier.AnonymousPro16x())
            .padding(.bottom, 30)
        }
    }
}
