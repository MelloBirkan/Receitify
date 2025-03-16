//
//  ContentView.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(RecipesViewModel.self) private var viewModel
    
    var body: some View {
        List(viewModel.recipes) { recipe in
            HStack {
                AsyncImage(url: URL(string: recipe.image)) { Image in
                    Image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(.rect(cornerRadius: 6))
                } placeholder: {
                    ProgressView()
                }

                Text(recipe.title)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.blue)
            }
        }
        .listStyle(.plain)
        .padding()
        .onAppear {
            viewModel.getRecipes()
        }
    }
}

#Preview {
    ContentView()
        .environment(RecipesViewModel())
}
