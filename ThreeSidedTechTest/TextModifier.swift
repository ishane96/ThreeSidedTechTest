//
//  TextModifier.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

class TextModifier {

    struct PoppinsBold18x: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Poppins-Bold", size: 18))
        }
    }

    struct PoppinsBold16x: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Poppins-Bold", size: 16))
        }
    }

    struct AnonymousPro16x: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Anonymous Pro", size: 16))
                .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
        }
    }
}
