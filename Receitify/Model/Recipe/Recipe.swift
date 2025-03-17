//
//  Receipe.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 17/03/25.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String?
    let imageType: String?
    let servings: Int?
    let readyInMinutes: Int?
    let cookingMinutes: Int?
    let preparationMinutes: Int?
    let license: String?
    let sourceName: String?
    let sourceUrl: String?
    let spoonacularSourceUrl: String?
    let healthScore: Double?
    let spoonacularScore: Double?
    let pricePerServing: Double?
    let analyzedInstructions: [AnalyzedInstruction]?
    let cheap: Bool?
    let creditsText: String?
    let cuisines: [String]?
    let dairyFree: Bool?
    let diets: [String]?
    let gaps: String?
    let glutenFree: Bool?
    let instructions: String?
    let ketogenic: Bool?
    let lowFodmap: Bool?
    let occasions: [String]?
    let sustainable: Bool?
    let vegan: Bool?
    let vegetarian: Bool?
    let veryHealthy: Bool?
    let veryPopular: Bool?
    let whole30: Bool?
    let weightWatcherSmartPoints: Int?
    let dishTypes: [String]?
    let extendedIngredients: [ExtendedIngredient]?
    let summary: String?
    let winePairing: WinePairing?
}

struct AnalyzedInstruction: Codable {
    let name: String?
    let steps: [Step]?
}

struct Step: Codable {
    let number: Int
    let step: String
    let ingredients: [Ingredient]?
    let equipment: [Equipment]?
}

struct Ingredient: Codable {
    let id: Int
    let name: String
    let localizedName: String?
    let image: String?
}

struct Equipment: Codable {
    let id: Int
    let name: String
    let localizedName: String?
    let image: String?
}

struct ExtendedIngredient: Codable {
    let aisle: String?
    let amount: Double
    let consistency: String?
    let id: Int
    let image: String?
    let measures: Measures?
    let meta: [String]?
    let name: String
    let original: String
    let originalName: String
    let unit: String
}

struct Measures: Codable {
    let metric: Measure?
    let us: Measure?
}

struct Measure: Codable {
    let amount: Double?
    let unitLong: String?
    let unitShort: String?
}

struct WinePairing: Codable {
    let pairedWines: [String]?
    let pairingText: String?
    let productMatches: [ProductMatch]?
}

struct ProductMatch: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: String?
    let imageUrl: String?
    let averageRating: Double?
    let ratingCount: Double?
    let score: Double?
    let link: String?
}
