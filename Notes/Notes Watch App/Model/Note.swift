//
//  Note.swift
//  Notes Watch App
//
//  Created by Yuvan Shankar on 06/12/2023.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
