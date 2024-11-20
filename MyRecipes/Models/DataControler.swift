//
//  DataControler.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftData
import Foundation


//enum PreviewContainer {
//    @MainActor
//    static var container: ModelContainer = {
//        let schema = Schema([User.self, Recipe.self, RecipeIngredient.self, Ingredient.self])
//        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
//        
//        do {
//            let container = try ModelContainer(for: schema, configurations: configuration)
//            print(URL.applicationSupportDirectory.path(percentEncoded: false))
//            // Add mock data
//            Task { @MainActor in
//                // Create a user
//                let user = User(username: "John Doe", email: "john@example.com", recipes: [], friends: [])
//                container.mainContext.insert(user)
//                
//                // Create some ingredients
//                let flour = Ingredient(name: "Flour")
//                let sugar = Ingredient(name: "Sugar")
//                let eggs = Ingredient(name: "Eggs")
//                
//                container.mainContext.insert(flour)
//                container.mainContext.insert(sugar)
//                container.mainContext.insert(eggs)
//                
//                // Create a recipe
//                let cake = Recipe(title: "Simple Cake", desc: "A delicious homemade cake", user: user)
//                container.mainContext.insert(cake)
//                
//                // Add ingredients to the recipe
//                let cakeFlour = RecipeIngredient(recipe: cake, ingredient: flour, quantity: 2, unit: .cup)
//                let cakeSugar = RecipeIngredient(recipe: cake, ingredient: sugar, quantity: 1, unit: .cup)
//                let cakeEggs = RecipeIngredient(recipe: cake, ingredient: eggs, quantity: 3, unit: .l)
//                
//                container.mainContext.insert(cakeFlour)
//                container.mainContext.insert(cakeSugar)
//                container.mainContext.insert(cakeEggs)
//                
//                try container.mainContext.save()
//            }
//            
//            return container
//        } catch {
//            fatalError("Failed to create preview container: \(error.localizedDescription)")
//        }
//    }()
//}
struct Preview {
    let container: ModelContainer
    init(_ models: any PersistentModel.Type...) {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema(models)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not create preview container")
        }
    }
    
    func addExamples(_ examples: [any PersistentModel]) {
        Task { @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
}
