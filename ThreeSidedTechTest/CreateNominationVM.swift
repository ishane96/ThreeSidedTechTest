//
//  CreateNominationVM.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

class CreateNominationVM: ObservableObject {

    @Published var ratings = [Rating(id: 1, imgIcon: "icVeryUnfair", text: "Very Unfair", isSelected: false),
                              Rating(id: 2, imgIcon: "icUnfair", text: "Unfair", isSelected: false),
                              Rating(id: 3, imgIcon: "icNotSure", text: "Not Sure", isSelected: false),
                              Rating(id: 4, imgIcon: "icFair", text: "fair", isSelected: false),
                              Rating(id: 5, imgIcon: "icVeryFair", text: "Very Fair", isSelected: false)]

    @Published var nomination: Nomination?
    @Published var reason = ""
    @Published var process = ""
    @Published var nomineeId = ""
    @Published var nominees: [Nominee] = []
    @Published var selectedNominee = ""

    func createNomination() {
        NominationsAPI.shared.createNominationAPI(nomineeId: nomineeId, reason: reason, process: process) { response, code, error in

        }
    }

    func getNominees() {
        NominationsAPI.shared.getAllData(url: "https://cube-academy-api.cubeapis.com/api/nominee", NomineeResponse.self) { response, code, error in
            self.nominees = response?.data ?? []
        }
    }
}
