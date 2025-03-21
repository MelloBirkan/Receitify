//
//  DataService.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func fetchRecipes(query: String?) async -> SearchRecipes? {
        guard let apiKey else {
            print("API key not found in Info.plist")
            return nil
        }
        
        var endpoint = "https://api.spoonacular.com/recipes/complexSearch"
        
        if let query = query {
            let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            endpoint += "?query=\(encodedQuery)"
        }
        
        if let url = URL(string: endpoint) {
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(SearchRecipes.self, from: data)
                return result
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    func fetchRecipe(id: Int) async -> Recipe? {
        guard let apiKey else {
            print("API key not found in Info.plist")
            return nil
        }
        
        if let url = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?includeNutrition=false") {
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(Recipe.self, from: data)
                return result
            } catch {
                print(error)
            }
        }
        return nil
    }
}
