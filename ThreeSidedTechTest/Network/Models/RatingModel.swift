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
    var textToApi: String
    var selectionIcon: String?
    var isSelected: Bool?

    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return lhs.id == rhs.id // Assuming 'id' is used to uniquely identify an Exercise.
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Assuming 'id' is a property that uniquely identifies an Exercise.
    }

}
