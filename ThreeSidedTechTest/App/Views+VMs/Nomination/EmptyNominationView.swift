//
//  EmptyNominationView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct EmptyNominationView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "tray.fill")
                .resizable()
                .frame(width: 70, height: 70)
            Text("once you submit a nomination, you will be able to SEE it here.")
            Spacer()
        }
    }
}
