//
//  TopImageView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-25.
//

import SwiftUI

struct TopImageView: View {

    var img: String

    var body: some View {
        Image(img)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
    }
}
