//
//  ViewModel.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 16/03/25.
//

import Foundation
import Observation

@Observable
class ReceipesViewModel {
    let dataService = DataService()
    var recipes: [RecipeSummary] = []
    var selectedReceipe: Recipe? = nil
    
    func getRecipes(query: String? = nil) {
        Task {
            if let recipesData = await self.dataService.fetchRecipes(query: query)?.results {
                recipes = recipesData
            }
        }
    }
    
    func getReceipeDetails(id: Int) {
        Task {
            selectedReceipe = await dataService.fetchRecipe(id: id)
        }
    }
}
