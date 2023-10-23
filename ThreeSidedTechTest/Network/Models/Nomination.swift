//
//  CreateNomination.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

struct NominationResponse: Codable {
    let data: [Nomination]
}

struct CreateNominationResponse: Codable {
    let data: Nomination
}

// MARK: - Datum
struct Nomination: Codable {
    let nominationID, nomineeID, reason, process: String
    let dateSubmitted, closingDate: String

    enum CodingKeys: String, CodingKey {
        case nominationID = "nomination_id"
        case nomineeID = "nominee_id"
        case reason, process
        case dateSubmitted = "date_submitted"
        case closingDate = "closing_date"
    }
}

struct NomineeResponse: Codable {
    let data: [Nominee]
}

// MARK: - Datum
struct Nominee: Codable {
    let nomineeID, firstName, lastName: String?

    enum CodingKeys: String, CodingKey {
        case nomineeID = "nominee_id"
        case firstName = "first_name"
        case lastName = "last_name"
    }

    static func == (lhs: Nominee, rhs: Nominee) -> Bool {
        // You need to implement the equality check between two Exercise instances.
        // For example:
        return lhs.nomineeID == rhs.nomineeID // Assuming 'id' is used to uniquely identify an Exercise.
    }

    func hash(into hasher: inout Hasher) {
        // You need to provide a way to generate a hash value for your Exercise instance.
        // You can use properties or other values that uniquely identify an Exercise.
        // For example:
        hasher.combine(nomineeID) // Assuming 'id' is a property that uniquely identifies an Exercise.
    }
}
