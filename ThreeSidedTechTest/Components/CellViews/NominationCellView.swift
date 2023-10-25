//
//  NominationCellView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct NominationCellView: View {

    var name: String
    var reason: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(name)
                .modifier(TextModifier.AnonymousProBold16x())
            Text(reason)
                .lineLimit(1)
                .modifier(TextModifier.AnonymousPro16x())
        }
    }
}
