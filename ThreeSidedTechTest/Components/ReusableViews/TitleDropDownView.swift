//
//  TitleDropDownView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct TitleDropDownView: View {

    var options: [Nominee]
    @Binding var nomineeId: String
    @Binding var selectedOption: String
    var title: String

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text("*")
                    .foregroundColor(.pink)
                Text(title)
                    .modifier(TextModifier.PoppinsBold16x())
            }

            CustomDropdownView(selectedOption: $selectedOption,
                               options: options,
                               nomineeId: $nomineeId)
            .modifier(TextModifier.AnonymousPro16x())
            .padding(.bottom, 40)

        }

        Divider()
            .padding(.bottom, 40)
    }
}
