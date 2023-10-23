//
//  RatingModel.swift
//  ThreeSidedTechTest
//
//  Created by Achintha kahawalage on 2023-10-23.
//

import Foundation

struct Rating: Identifiable {
    var id: Int
    var imgIcon: String
    var text: String
    var selectionIcon: String?
    var isSelected: Bool?

    static func == (lhs: Rating, rhs: Rating) -> Bool {
        // You need to implement the equality check between two Exercise instances.
        // For example:
        return lhs.id == rhs.id // Assuming 'id' is used to uniquely identify an Exercise.
    }

    func hash(into hasher: inout Hasher) {
        // You need to provide a way to generate a hash value for your Exercise instance.
        // You can use properties or other values that uniquely identify an Exercise.
        // For example:
        hasher.combine(id) // Assuming 'id' is a property that uniquely identifies an Exercise.
    }

}
