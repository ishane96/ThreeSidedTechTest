//
//  CreateNominationView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

struct CreateNominationView: View {

    @ObservedObject var viewModel = CreateNominationVM()
    @Environment(\.presentationMode) var presentation
    @State private var isPresenting: Bool = false
    @State var nominationSubmitted = false
    @Binding var isStateChanged: Bool
    @Binding var nominees: [Nominee]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false) {
                Image("sampleImg")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)

                VStack(alignment: .leading, spacing: 10) {
                    TitleAndDescriptionView(title: String.nominateTitle,
                                            descrptn: String.nominateDescription)
                    TitleDropDownView(options: nominees, nomineeId: $viewModel.nomineeId,
                                      selectedOption: $viewModel.selectedOption, title: String.cubeNameTitle)
                    TitleAndDescriptionView(title: String.reasonToNominateTitle,
                                            descrptn: String.reasonToNominateDescription)
                    TitleTextEditorView(title: String.resoning, reason: $viewModel.reason)

                    Group {
                        Text("IS HOW WE CURRENTLY RUN  FAIR? ")
                            .fontWeight(.bold) +
                        Text("CUBE OF THE MONTH ")
                            .foregroundColor(.pink)
                            .fontWeight(.bold) +
                        Text("FAIR?")
                            .fontWeight(.bold)
                        Text(String.cubeChoosenTitle)
                            .modifier(TextModifier.AnonymousPro16x())
                            .padding(.bottom, 30)
                    }

                    ForEach(0..<viewModel.ratings.count, id: \.self) { rating in
                        RatingCellView(imgIcon:
                                        viewModel.ratings[rating].imgIcon,
                                       text: viewModel.ratings[rating].text,
                                       isSelected: viewModel.process == viewModel.ratings[rating].textToApi)
                        .onTapGesture {
                            viewModel.process = viewModel.ratings[rating].textToApi
                        }
                    }
                }
                .padding()
            }

            CreateNominationBottomView(backBtnAction: {
                if viewModel.nomineeId != "" || viewModel.reason != "" || viewModel.process != "" {
                    self.isPresenting = true
                } else {
                    self.presentation.wrappedValue.dismiss()
                }
            }, isPresenting: $isPresenting, bottomSheetShow: {
                self.presentation.wrappedValue.dismiss()

            }, submitAction: {
                submitAction()
            }, formValidation: viewModel.formValidation())
        }
        .customNavigationBar(isBackButton: false, title: "Create a Nomination", isTitle: true) {}
    }

    func submitAction() {
        viewModel.createNomination { success in
            if success {
                self.isStateChanged = true
                DispatchQueue.main.async {
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }
    }
}
