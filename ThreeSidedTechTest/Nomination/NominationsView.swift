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

        let authToken = "101|gW20JqFF1wBgRX3ueZzJYAYH7ev8BrwwiTnUN6NR626ca696"
        KeychainWrapper.shared.saveAuthTokenToKeychain(token: authToken)
    }
    @State var nominationBtnPressed = false
    @StateObject var viewModel = NominationsVM()

    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("greenBlobs")
                        .resizable()
                        .frame(height: 100)
                        .scaledToFit()
                        .overlay(
                            Text("YOUR NOMINATION")
                                .modifier(TextModifier.PoppinsBold24x())
                                .padding()
                            , alignment: .leading
                        )
                        .background(.green)
                    
                    List {
                        ForEach(0..<viewModel.nomination.count, id: \.self) { index in
                            NominationCellView(name: viewModel.nomination[index].process, reason: viewModel.nomination[index].reason)
                        }
                    }
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
            .onAppear {
                self.viewModel.getNominations()
            }
            .customNavigationBar(isBackButton: false, title: "Title", isTitle: false, backButtonAction: {})
        }
    }
}

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
