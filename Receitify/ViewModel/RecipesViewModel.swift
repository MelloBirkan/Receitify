//
//  ViewModel.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 16/03/25.
//

import Foundation
import Observation

@Observable
class RecipesViewModel {
    let dataService = DataService()
    var recipes: [Recipe] = []
    
    func getRecipes() {
        Task {
            if let recipesData = await self.dataService.fetchRecipes()?.results {
                recipes = recipesData
                print(recipes)
            }
        }
    }
}
