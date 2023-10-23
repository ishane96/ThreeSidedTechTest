//
//  NominationsVM.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

class NominationsVM: ObservableObject {

    @Published var nomination: [Nomination] = []

    func getNominations() {

        NominationsAPI.shared.getAllData(url: "https://cube-academy-api.cubeapis.com/api/nomination", NominationResponse.self) { response, code, error in

            self.nomination = response?.data ?? []
        }
    }
}
