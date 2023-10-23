//
//  ContentView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-22.
//

import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black // Set the desired background color
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        VStack {
            VStack {
                
                List {
                    ForEach(0..<10, id: \.self) { index in
                        NominationCellView()
                    }
                }
                .padding()
                .listStyle(PlainListStyle())
                //                EmptyNominationView()
            }
            BottomButton(title: "Create New Notification")
        }
        .customNavigationBar(isBackButton: false, title: "Title", isTitle: false, backButtonAction: {})
    }
}

struct NominationCellView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("David Jones")
            Text("Always goes above and...")
        }
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
