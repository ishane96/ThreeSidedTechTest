//
//  CreateNominationBottomView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct CreateNominationBottomView: View {

    var backBtnAction: () -> Void
    @Binding var isPresenting: Bool
    var bottomSheetShow: () -> Void
    var submitAction: () -> Void
    var formValidation: Bool

    var body: some View {

        HStack {
            Button(action: {
                backBtnAction()
            }, label: {
                Text("Back")
            })
            .padding(.horizontal, 30)
            .padding(.vertical)
            .foregroundColor(.black)
            .modifier(TextModifier.PoppinsBold14x())
            .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.black, lineWidth: 1.0))
            .padding(.leading, 40)
            .sheet(isPresented: $isPresenting) {
                BottomSheetView {
                    bottomSheetShow()
                }
            }

            Button(action: {submitAction()}, label: {
                Text(String.submitBtn)
            })
            .minimumScaleFactor(0.5)
            .padding()
            .frame(maxWidth: .infinity)
            .background(formValidation ? .black : .gray)
            .modifier(TextModifier.PoppinsBold14x())
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .disabled(!formValidation)
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
