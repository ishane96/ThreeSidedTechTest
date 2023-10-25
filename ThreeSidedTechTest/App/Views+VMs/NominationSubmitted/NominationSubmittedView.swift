//
//  NominationSubmittedView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct NominationSubmittedView: View {

    @Environment(\.presentationMode) var presentation
    @Binding var isStateChanged: Bool
    @State var isNewNomination = false
    @Binding var isCreateNewNomination: Bool

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {

                ScrollView {
                TopImageView(img: "successImg")

                VStack(alignment: .center, spacing: 25) {
                    Text("NOMINATION SUBMITTED")
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                        .modifier(TextModifier.PoppinsBold32x())

                    Text("Thank you for taking the time to fill out this form! Why not nominate another cube?")
                        .multilineTextAlignment(.center)
                        .modifier(TextModifier.AnonymousPro16x())
                }
                .padding(.all, 40)
            }
                Spacer()

                VStack(spacing: 15) {
                    BottomButton(title: String.createNewNominationTitle, isPlain: false, btnAction: {
                        self.isCreateNewNomination = true
                        self.presentation.wrappedValue.dismiss()
                    })
                    BottomButton(title: "BACK TO HOME", isPlain: true, btnAction: {
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
            .customNavigationBar(isBackButton: false, title: "Nomination Submitted", isTitle: true) {}
        }
    }
}
