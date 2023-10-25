//
//  TitleTextEditorView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct TitleTextEditorView: View {

    var title: String
    @Binding var reason: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("*")
                    .foregroundColor(.pink)
                Text(title)
                    .modifier(TextModifier.PoppinsBold16x())
            }

            TextEditor(text: $reason)
                .frame(height: 150)
                .modifier(TextModifier.AnonymousPro16x())
                .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.gray, lineWidth: 1.0))
                .padding(.bottom, 30)

            Divider()
                .padding(.bottom, 30)
        }
    }
}
