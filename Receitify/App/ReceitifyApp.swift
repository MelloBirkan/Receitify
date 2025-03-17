//
//  ReceitifyApp.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import SwiftUI

@main
struct ReceitifyApp: App {
    @State private var recipesViewModel = ReceipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(recipesViewModel)
        }
    }
}
