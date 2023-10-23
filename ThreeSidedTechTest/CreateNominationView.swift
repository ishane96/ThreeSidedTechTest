//
//  CreateNominationView.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import SwiftUI

struct CreateNominationView: View {
    
    @State private var selectedOption: String = "Select an Option"
    @State var cubes = ["Any Body Part", "Arms", "Back", "Cardio", "Chest", "Core", "FullBody", "Legs", "Olympic", "Shoulders", "Other"]
    @State var reasonTxt = ""
    @ObservedObject var viewModel = CreateNominationVM()
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Image("sampleImg")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)

                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("I'D LIKE TO NOMINATE...")
                            .modifier(TextModifier.PoppinsBold18x())

                        Text("Please select a cube who you feel has done something honourable this month or just all round has a great work ethic.")
                            .modifier(TextModifier.AnonymousPro16x())
                            .padding(.bottom, 30)
                    }

                    Group {
                        HStack {
                            Text("*")
                                .foregroundColor(.pink)
                            Text("Cube's Name")
                                .modifier(TextModifier.PoppinsBold16x())
                        }

                        CustomDropdownView(selectedOption: $selectedOption, options: viewModel.nominees, nomineeId: $viewModel.nomineeId)
                            .modifier(TextModifier.AnonymousPro16x())
                            .padding(.bottom, 40)
                    }

                    Divider()
                        .padding(.bottom, 40)
                    Text("I’d like to nominate THIS CUBE BECAUSE...")
                        .modifier(TextModifier.PoppinsBold18x())

                    Text("Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐")
                        .modifier(TextModifier.AnonymousPro16x())
                        .padding(.bottom, 30)

                    HStack(spacing: 3) {
                        Text("*")
                            .foregroundColor(.pink)
                        Text("Reasoning")
                            .modifier(TextModifier.PoppinsBold16x())
                    }

                    TextEditor(text: $viewModel.reason)
                        .frame(height: 150)
                        .modifier(TextModifier.AnonymousPro16x())
                        .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.gray, lineWidth: 1.0))
                        .padding(.bottom, 30)

                    Divider()
                        .padding(.bottom, 30)

                    Group {
                        Text("IS HOW WE CURRENTLY RUN  FAIR? ")
                            .fontWeight(.bold) +
                        Text("CUBE OF THE MONTH ")
                            .foregroundColor(.pink)
                            .fontWeight(.bold) +
                        Text("FAIR?")
                            .fontWeight(.bold)

                        Text("As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?")
                            .modifier(TextModifier.AnonymousPro16x())
                            .padding(.bottom, 30)
                    }

                    ForEach(0..<viewModel.ratings.count, id: \.self) { rating in
                        RatingCellView(imgIcon:
                                        viewModel.ratings[rating].imgIcon,
                                       text: viewModel.ratings[rating].text,
                                       isSelected:
                                        viewModel.ratings[rating].isSelected ?? false)
                        .onTapGesture {
                            viewModel.ratings.indices.forEach { ind in
                                viewModel.ratings[ind].isSelected = (ind == rating)
                            }

                            if let selectedRating = viewModel.ratings.first(where: { $0.isSelected == true }) {
                                viewModel.process = selectedRating.text
                            }
                        }
                    }
                }
                .padding()
                .onAppear {
                    viewModel.getNominees()
                }
            }
            //                    NavigationLink(destination: CreateNominationView(), isActive: $nominationBtnPressed) {

            HStack {
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                })
                .padding(.horizontal, 30)
                .padding(.vertical)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 2.0).stroke(Color.black, lineWidth: 1.0))
                .padding(.leading, 40)

                Button(action: {
                    selectedOption = viewModel.selectedNominee
                    viewModel.createNomination()
                }, label: {
                    Text("SUBMIT NOMINATION")
                })
                .minimumScaleFactor(0.5)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(
                Color.white
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                    .mask(Rectangle().padding(.top, -20))
            )
            //                    }
        }
        .customNavigationBar(isBackButton: false, title: "Create a Nomination", isTitle: true) {}
    }
}

struct CreateNominationView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNominationView()
    }
}
