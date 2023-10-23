//
//  CreateNominationVM.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

class CreateNominationVM: ObservableObject {

    @Published var ratings = [Rating(id: 1, imgIcon: "icVeryUnfair", text: "Very Unfair", isSelected: false),
                              Rating(id: 2, imgIcon: "icUnfair", text: "Unfair",  isSelected: false),
                              Rating(id: 3, imgIcon: "icNotSure", text: "Not Sure",  isSelected: false),
                              Rating(id: 4, imgIcon: "icFair", text: "Fair",  isSelected: false),
                              Rating(id: 5, imgIcon: "icVeryFair", text: "Very Fair",  isSelected: false)]
}
