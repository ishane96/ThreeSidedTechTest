//
//  Nominee.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-26.
//

import Foundation

struct Nominee: Codable {
    let nomineeID, firstName, lastName: String?

    enum CodingKeys: String, CodingKey {
        case nomineeID = "nominee_id"
        case firstName = "first_name"
        case lastName = "last_name"
    }

    static func == (lhs: Nominee, rhs: Nominee) -> Bool {
        return lhs.nomineeID == rhs.nomineeID
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(nomineeID)
    }
}
