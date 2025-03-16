//
//  ContentView.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import SwiftUI

struct ContentView: View {
    let service = DataService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await service.fetchRecipes()
        }
    }
}

#Preview {
    ContentView()
}
