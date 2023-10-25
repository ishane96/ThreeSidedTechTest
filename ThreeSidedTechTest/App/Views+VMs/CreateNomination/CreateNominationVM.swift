//
//  CreateNominationVM.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

typealias CompletionHandler = (_ success: Bool) -> Void

class CreateNominationVM: ObservableObject {

    // swiftlint:disable:next line_length
    @Published var ratings = [Rating(id: 1, imgIcon: "icVeryUnfair", text: "Very Unfair", textToApi: "very_unfair", isSelected: false),
                              Rating(id: 2, imgIcon: "icUnfair", text: "Unfair",
                                     textToApi: "unfair", isSelected: false),
                              Rating(id: 3, imgIcon: "icNotSure", text: "Not Sure",
                                     textToApi: "not_sure", isSelected: false),
                              Rating(id: 4, imgIcon: "icFair", text: "Fair",
                                     textToApi: "fair", isSelected: false),
                              Rating(id: 5, imgIcon: "icVeryFair", text: "Very Fair",
                                     textToApi: "very_fair", isSelected: false)]

    @Published var nomination: Nomination?
    @Published var reason = ""
    @Published var process = ""
    @Published var nomineeId = ""
    @Published var nominees: [Nominee] = []
    @Published var selectedOption: String = "Select an Option"
    @Published var isErrored = false
    @Published var errorMsg = ""

    func createNomination(completion: @escaping CompletionHandler) {
        NominationsAPI.shared.createNominationAPI(nomineeId: nomineeId,
                                                  reason: reason,
                                                  process: process) { [weak self] code, error in
            guard let self = self else {return}
            if error == nil && code == 201 {
                DispatchQueue.main.async {
                    self.reason = ""
                    self.process = ""
                    self.isErrored = false
                }
                completion(true)
            } else {
                self.isErrored = true
                self.errorMsg = error?.localizedDescription ?? ""
                completion(true)
            }
        }
    }

    func formValidation() -> Bool {
        return nomineeId != "" && reason != "" && process != ""
    }
}
