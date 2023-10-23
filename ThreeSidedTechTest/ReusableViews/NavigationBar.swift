//
//  NavigationBar.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-22.
//

import SwiftUI

extension View {
    public func customNavigationBar(isBackButton: Bool,
                                    title: String,
                                    isTitle: Bool,
                                    backButtonAction: @escaping() -> Void) -> some View {
        self
            .navigationTitle(isTitle ? title : "")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    HStack {
                Button(action: {
                    backButtonAction()
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .tint(.white)
                        .frame(width: 20, height: 20)
                        .opacity(isBackButton ? 1 : 0)
                }
                if !isTitle {
                    Image("ic3sc")
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(UIScreen.main.bounds.size.width/4+30)
                }
            }
            )
    }
}
