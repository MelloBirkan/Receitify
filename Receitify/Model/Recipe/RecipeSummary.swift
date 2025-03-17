//
//  Recipe.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import Foundation

struct RecipeSummary: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}
