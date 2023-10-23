//
//  ContentView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-22.
//

import SwiftUI

struct NominationsView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black // Set the desired background color
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    @State var nominationBtnPressed = false
    
    var body: some View {
        NavigationView {
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
                NavigationLink(destination: CreateNominationView(), isActive: $nominationBtnPressed) {
                    BottomButton(title: "Create New Notification", isPlain: false, btnAction: {self.nominationBtnPressed = true})
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(
                            Color.white
                                .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                                .mask(Rectangle().padding(.top, -20))
                        )
                }
            }
            .customNavigationBar(isBackButton: false, title: "Title", isTitle: false, backButtonAction: {})
        }
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

struct NominationsView_Previews: PreviewProvider {
    static var previews: some View {
        NominationsView()
    }
}
