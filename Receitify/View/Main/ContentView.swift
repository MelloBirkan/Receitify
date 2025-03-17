//
//  ContentView.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 15/03/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(ReceipesViewModel.self) private var viewModel
    @State private var query: String = ""
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    
                    TextField("Buscar receitas", text: $query)
                        .padding(.vertical, 10)
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Button {
                    viewModel.getRecipes(query: query)
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.orange.opacity(0.6))
                        .cornerRadius(10)
                }
            }
            .padding(.bottom, 8)
            
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
                        .foregroundStyle(.orange.opacity(0.6))
                }
                .onTapGesture {
                    viewModel.getReceipeDetails(id: recipe.id)
                }
            }
            .listStyle(.plain)
            
            .onAppear {
                viewModel.getRecipes()
            }
            .sheet(item: $viewModel.selectedReceipe) { _ in
                ReceipeDetailView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ReceipesViewModel())
}
