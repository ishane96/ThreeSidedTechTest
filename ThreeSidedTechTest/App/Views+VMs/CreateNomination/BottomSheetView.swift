//
//  BottomSheetView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct BottomSheetView: View {

    @Environment(\.presentationMode) var presentation
    var leaveAction: () -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {
            Text("ARE YOU SURE?")
                .modifier(TextModifier.PoppinsBold18x())
                .padding(.all, 30)

            Text("If you leave this page, you will loose any progress made.")
                .modifier(TextModifier.AnonymousPro16x())
                .padding(.leading, 30)

            Spacer()

            VStack(spacing: 15) {
                BottomButton(title: "YES, LEAVE PAGE", isPlain: true, btnAction: {
                    leaveAction()
                    self.presentation.wrappedValue.dismiss()
                })

                BottomButton(title: "CANCEL", isPlain: true, btnAction: {
                    self.presentation.wrappedValue.dismiss()
                })
            }
            .padding(.all, 30)
            .frame(maxWidth: .infinity)
            .frame(height: 160)
            .background(
                Color.white
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                    .mask(Rectangle().padding(.top, -20))
            )
        }
        .presentationDetents([.medium])
    }
}
