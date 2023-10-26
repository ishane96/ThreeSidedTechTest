//
//  EmptyNominationView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct EmptyNominationView: View {
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            Image(systemName: "tray.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 70, height: 70)
            Text("once you submit a nomination, you will be able to SEE it here.")
                .multilineTextAlignment(.center)
                .modifier(TextModifier.AnonymousPro16x())
            Spacer()
        }
        .padding(.all, 40)
    }
}
