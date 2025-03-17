//
//  ContentView.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ReceipesViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
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
            .onTapGesture {
                viewModel.getReceipeDetails(id: recipe.id)
            }
        }
        .listStyle(.plain)
        .padding()
        .onAppear {
            viewModel.getRecipes()
        }
        .sheet(item: $viewModel.selectedReceipe) { _ in
            ReceipeDetailView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ReceipesViewModel())
}
