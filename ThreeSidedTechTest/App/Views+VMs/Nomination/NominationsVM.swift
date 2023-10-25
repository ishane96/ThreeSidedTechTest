//
//  NominationsVM.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

class NominationsVM: ObservableObject {

    @Published var nomination: [Nomination] = []
    @Published var nominees: [Nominee] = []
    @Published var isErrored = false
    @Published var errorMsg = ""

    func getNominations(completion: @escaping CompletionHandler) {

        NominationsAPI.shared.getAllData(url: "https://cube-academy-api.cubeapis.com/api/nomination",
                                         NominationResponse.self) { response, code, error in

            if error == nil && code == 200 {
                DispatchQueue.main.async {
                    self.isErrored = false
                    self.nomination = response?.data ?? []
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    self.isErrored = true
                    self.errorMsg = error?.localizedDescription ?? ""
                }
                completion(false)
            }
        }
    }

    func getNominees(completion: @escaping CompletionHandler) {
        NominationsAPI.shared.getAllData(url: "https://cube-academy-api.cubeapis.com/api/nominee",
                                         NomineeResponse.self) { response, code, error in
            if error == nil && code == 200 {
                DispatchQueue.main.async {
                    self.isErrored = false
                    self.nominees = response?.data ?? []
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    self.isErrored = true
                    self.errorMsg = error?.localizedDescription ?? ""
                }
                completion(false)
            }
        }
    }

    func getName(id: String) -> String {
        let firstName = nominees.first {$0.nomineeID == id}?.firstName ?? ""
        let lastName = nominees.first {$0.nomineeID == id}?.lastName ?? ""

        let fullName = "\(firstName) \( lastName)"
        return fullName
    }
}
