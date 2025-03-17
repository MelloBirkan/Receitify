# Receitify

Um aplicativo iOS para pesquisar e descobrir receitas deliciosas utilizando a API Spoonacular.

## 📱 Sobre o Projeto

Receitify é um aplicativo Swift que permite aos usuários:
- Buscar receitas por palavras-chave
- Visualizar detalhes completos das receitas
- Explorar ingredientes e instruções de preparo
- Descobrir informações nutricionais e de harmonização com vinhos

## 🛠️ Tecnologias Utilizadas

- Swift
- SwiftUI
- Observation (Swift 5.9+)
- API Spoonacular
- Arquitetura MVVM
- Async/Await para chamadas de rede

## 🚀 Funcionalidades

- **Pesquisa de Receitas**: Busque receitas por nome, ingredientes ou tipo de culinária
- **Detalhes Completos**: Visualize ingredientes, instruções, tempo de preparo e mais
- **Interface Intuitiva**: Design moderno e fácil de navegar

## 📋 Pré-requisitos

- iOS 17.0+
- Xcode 15.0+
- Chave de API do Spoonacular

## ⚙️ Configuração

1. Clone o repositório

2. Crie uma conta em [Spoonacular API](https://spoonacular.com/food-api) e obtenha sua chave de API

3. Adicione sua chave de API no arquivo `Config.xcconfig`:
```
API_KEY = sua_chave_api_aqui
```

4. Abra o projeto no Xcode e execute

## 🏗️ Arquitetura

O projeto segue a arquitetura MVVM (Model-View-ViewModel):

- **Model**: Representa os dados e a lógica de negócios
- **View**: Interfaces de usuário em SwiftUI
- **ViewModel**: Gerencia o estado da aplicação e a comunicação com o modelo

## 🙏 Agradecimentos

- [Spoonacular API](https://spoonacular.com/food-api) por fornecer dados de receitas
- [SwiftUI](https://developer.apple.com/xcode/swiftui/) pela moderna framework de UI 