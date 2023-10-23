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
    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    self.isDropdownVisible.toggle()
                }
            }) {
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
                    LazyVStack(alignment: .leading) {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                self.selectedOption = option
                                withAnimation {
                                    self.isDropdownVisible.toggle()
                                }
                            }) {
                                Text(option)
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
