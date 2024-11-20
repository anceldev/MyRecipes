//
//  MyRecipesApp.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftData
import SwiftUI

@main
struct MyRecipesApp: App {
    var container: ModelContainer
    init() {
        do {
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
            let storeURL = URL.documentsDirectory.appending(path: "my.recipes.v1")
            let config = ModelConfiguration(url: storeURL)
            let schema = Schema([User.self, Recipe.self, RecipeIngredient.self, Ingredient.self])
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            print(error.localizedDescription)
            fatalError("Failed to configure SwiftData container")
        }
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
