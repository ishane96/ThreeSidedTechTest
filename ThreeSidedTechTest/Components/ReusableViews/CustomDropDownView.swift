//
//  CustomDropDownView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

struct CustomDropdownView: View {
    @State var isDropdownVisible = false
    @Binding var selectedOption: String
    let options: [Nominee]
    @Binding var nomineeId: String

    var body: some View {
        VStack(alignment: .leading) {
            Button {
                withAnimation {
                    self.isDropdownVisible.toggle()
                }
            }label: {
                HStack {
                    Text(selectedOption)
                    Spacer()
                    Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                        .foregroundColor(.pink)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.black)
            .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.gray, lineWidth: 1.0))

            if isDropdownVisible {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(options, id: \.nomineeID) { option in
                            Button {
                                self.selectedOption = "\(option.firstName ?? "") \( option.lastName ?? "")"
                                self.nomineeId = option.nomineeID ?? ""
                                withAnimation {
                                    self.isDropdownVisible.toggle()
                                }
                            } label: {
                                Text("\(option.firstName ?? "") \( option.lastName ?? "")")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                            }
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
            }
        }
    }
}
