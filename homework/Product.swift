//
//  Model.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let description: String
}
