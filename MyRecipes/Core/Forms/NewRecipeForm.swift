//
//  NewRecipeForm.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftUI

struct NewRecipeForm: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var steps: [String] = []
    @State private var ingredients: [RecipeIngredient] = []
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $title)
                TextField("Description", text: $description)
                IngredientsField(ingredients: $ingredients)
                RecipeStepsField(steps: $steps)
            }
//            Spacer(minLength: 0)
            Button {
                addRecipe()
            } label: {
                Text("Add")
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("New Recipe")
        .navigationBarTitleDisplayMode(.inline)
    }
    private func addRecipe() {
        
    }
}

#Preview {
    let preview = Preview(Recipe.self, RecipeIngredient.self)
    NavigationStack {
        NewRecipeForm()
            .modelContainer(preview.container)
    }
}
