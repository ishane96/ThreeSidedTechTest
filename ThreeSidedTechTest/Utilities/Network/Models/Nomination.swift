//
//  CreateNomination.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

struct Nomination: Codable, Hashable {
    let nominationID, nomineeID, reason, process: String
    let dateSubmitted, closingDate: String

    enum CodingKeys: String, CodingKey {
        case nominationID = "nomination_id"
        case nomineeID = "nominee_id"
        case reason, process
        case dateSubmitted = "date_submitted"
        case closingDate = "closing_date"
    }

    static func == (lhs: Nomination, rhs: Nomination) -> Bool {
        return lhs.nominationID == rhs.nominationID
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(nominationID)
    }
}
