//
//  ReceipeDetailView.swift
//  Receitify
//
//  Created by Marcello Gonzatto Birkan on 17/03/25.
//

import SwiftUI

struct ReceipeDetailView: View {
    @Environment(ReceipesViewModel.self) private var viewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let receipe = viewModel.selectedReceipe
        
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Imagem da receita
                    if let imageURL = receipe?.image {
                        AsyncImage(url: URL(string: imageURL)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 300)
                                    .clipped()
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Título e informações gerais
                        VStack(alignment: .leading, spacing: 8) {
                            Text(receipe?.title ?? "Sem nome")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 4)
                            
                            // Tags informativas
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    if let receipe = receipe {
                                        if receipe.vegetarian == true {
                                            TagView(text: "Vegetariano", color: .green)
                                        }
                                        if receipe.vegan == true {
                                            TagView(text: "Vegano", color: .green)
                                        }
                                        if receipe.glutenFree == true {
                                            TagView(text: "Sem Glúten", color: .orange)
                                        }
                                        if receipe.dairyFree == true {
                                            TagView(text: "Sem Lactose", color: .blue)
                                        }
                                        if receipe.veryHealthy == true {
                                            TagView(text: "Saudável", color: .green)
                                        }
                                    }
                                }
                            }
                            
                            // Tempo e porções
                            HStack(spacing: 15) {
                                InfoItemView(
                                    icon: "clock",
                                    title: "Tempo",
                                    value: "\(receipe?.readyInMinutes ?? 0) min"
                                )
                                
                                InfoItemView(
                                    icon: "person.2",
                                    title: "Porções",
                                    value: "\(receipe?.servings ?? 0)"
                                )
                                
                                InfoItemView(
                                    icon: "heart",
                                    title: "Saúde",
                                    value: "\(Int(receipe?.healthScore ?? 0))/100"
                                )
                            }
                            .padding(.vertical, 8)
                        }
                        
                        Divider()
                        
                        // Ingredientes
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Ingredientes")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom, 8)
                            
                            if let ingredients = receipe?.extendedIngredients, !ingredients.isEmpty {
                                ForEach(ingredients, id: \.id) { ingredient in
                                    HStack(alignment: .center, spacing: 12) {
                                        // Bullet point laranja
                                        Circle()
                                            .fill(Color.orange)
                                            .frame(width: 10, height: 10)
                                        
                                        // Texto do ingrediente
                                        Text("\(ingredient.amount, specifier: "%.1f") \(ingredient.unit) \(ingredient.name)")
                                            .font(.system(size: 16))
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical, 6)
                                    
                                    if ingredients.last?.id != ingredient.id {
                                        Divider()
                                    }
                                }
                            } else {
                                Text("Nenhum ingrediente disponível")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 16)
                        
                        Divider()
                        
                        // Instruções
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Modo de Preparo")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom, 8)
                            
                            if let instructions = receipe?.analyzedInstructions?.first?.steps, !instructions.isEmpty {
                                ForEach(instructions, id: \.number) { step in
                                    HStack(alignment: .top, spacing: 16) {
                                        Text("\(step.number)")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .frame(width: 28, height: 28)
                                            .background(Color.orange)
                                            .clipShape(Circle())
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(step.step)
                                                .font(.body)
                                                .lineSpacing(4)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical, 6)
                                    
                                    if step.number != instructions.last?.number {
                                        Divider()
                                            .padding(.leading, 44)
                                            .padding(.vertical, 4)
                                    }
                                }
                            } else if let simpleInstructions = receipe?.instructions, !simpleInstructions.isEmpty {
                                Text(simpleInstructions)
                                    .font(.body)
                                    .lineSpacing(4)
                            } else {
                                Text("Nenhuma instrução disponível")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        // Resumo
                        if let summary = receipe?.summary, !summary.isEmpty {
                            VStack(alignment: .leading) {
                                Divider()
                                
                                Text("Sobre")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 16)
                                    .padding(.bottom, 8)
                                
                                Text(summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil))
                                    .font(.subheadline)
                            }
                        }
                        
                        // Informações adicionais
                        if let sourceURL = receipe?.sourceUrl, !sourceURL.isEmpty {
                            VStack(alignment: .leading) {
                                Divider()
                                
                                Text("Fonte")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 16)
                                    .padding(.bottom, 8)
                                
                                Link(destination: URL(string: sourceURL) ?? URL(string: "https://spoonacular.com")!) {
                                    HStack {
                                        Text(receipe?.sourceName ?? "Ver receita original")
                                            .font(.subheadline)
                                            .underline()
                                            .foregroundColor(.blue)
                                        
                                        Image(systemName: "arrow.up.right.square")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            // Botão de fechar sheet
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
                    }
                    .padding(.trailing, 60)
                    .padding(.top, 12)
                }
                
                Spacer()
            }
        }
    }
}

// Componentes de suporte
struct TagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .clipShape(Capsule())
    }
}

struct InfoItemView: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.orange)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    ReceipeDetailView()
        .environment(ReceipesViewModel())
}
