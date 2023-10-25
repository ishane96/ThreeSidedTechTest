//
//  ContentView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-22.
//

import SwiftUI

struct NominationsView: View {

    @State var nominationBtnPressed = false
    @StateObject var viewModel = NominationsVM()
    @State var isStateChanged = false
    @State var isCreateNewNomination = false
    let apiSemaphore = DispatchSemaphore(value: 0)

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ImageHeaderView(title: String.yourNominationsTitle, image: "greenBlobs")

                    if viewModel.nomination.count > 0 {
                        List {
                            ForEach(viewModel.nomination, id: \.self) { nomination in
                                NominationCellView(name: viewModel.getName(id: nomination.nomineeID),
                                                   reason: nomination.reason)
                            }
                        }
                        .listStyle(PlainListStyle())
                    } else {
                        EmptyNominationView()
                    }
                }
                .alert(viewModel.errorMsg, isPresented: $viewModel.isErrored) {
                    Button("OK", role: .cancel) { }
                }
                .onAppear {
                    getData()
                }

                NavigationLink(destination: CreateNominationView(isStateChanged: $isStateChanged,
                                                                 nominees: $viewModel.nominees),
                               isActive: $nominationBtnPressed) {
                    BottomButton(title: String.createNewNominationTitle, isPlain: false, btnAction: {
                        createNominationBtnAction()
                    })
                    .padding(.all, 30)
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(
                        Color.white
                            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                            .mask(Rectangle().padding(.top, -20))
                    )
                }
                NavigationLink(destination: CreateNominationView(isStateChanged: $isStateChanged,
                                                                 nominees: $viewModel.nominees),
                               isActive: $isCreateNewNomination) {}
            }
            .customNavigationBar(isBackButton: false, title: "", isTitle: false, backButtonAction: {})
        }
        .fullScreenCover(isPresented: $isStateChanged) {
            NominationSubmittedView(isStateChanged: $isStateChanged, isCreateNewNomination: $isCreateNewNomination)
        }
    }

    func createNominationBtnAction() {
        if isCreateNewNomination {
            self.nominationBtnPressed = false
            self.isCreateNewNomination = true
        } else {
            self.isCreateNewNomination = false
            self.nominationBtnPressed = true
        }
    }

    func getData() {
        // Dispatch to a background queue
        DispatchQueue.global(qos: .background).async {
            self.viewModel.getNominees { success in
                // Signal the semaphore to allow the nominations API call
                if success {
                    apiSemaphore.signal()
                }
            }
            // Wait for the nominees API call to complete
            apiSemaphore.wait()
            self.viewModel.getNominations { success in
                // Signal the semaphore to release it for potential further usage
                if success {
                    apiSemaphore.signal()
                }
            }
        }
    }
}

struct NominationsView_Previews: PreviewProvider {
    static var previews: some View {
        NominationsView()
    }
}
