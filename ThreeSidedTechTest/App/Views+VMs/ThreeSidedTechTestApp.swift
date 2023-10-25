//
//  ThreeSidedTechTestApp.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-22.
//

import SwiftUI

@main
struct ThreeSidedTechTestApp: App {

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        let authToken = String.AuthKey
        KeychainWrapper.shared.saveAuthTokenToKeychain(token: authToken)
    }
    var body: some Scene {
        WindowGroup {
            NominationsView()
        }
    }
}
