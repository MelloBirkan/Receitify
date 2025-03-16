//
//  SearchRecipes.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import Foundation

struct SearchRecipes: Decodable {
    let offset: Int?
    let number: Int?
    let results: [Recipe]
    let totalResults: Int?
}



