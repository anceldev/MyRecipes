//
//  IngredientsField.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 20/11/24.
//

import SwiftData
import SwiftUI

struct IngredientsField: View {
    @Binding var ingredients: [RecipeIngredient]
    @Query var allIngredients: [Ingredient]
    @State private var searchTerm = ""
    @State private var selectedUnit: IngredientUnit?
    @State private var showNewIngredientForm = false
    
    var searchedIngredients: [Ingredient] {
        if searchTerm.isEmpty {
            return allIngredients
        } else {
            let filteredIngredients = allIngredients.filter { $0.name == searchTerm }
            return filteredIngredients
        }
    }
    var body: some View {
        HStack {
            VStack {
                TextField("Search", text: $searchTerm)
                ForEach(searchedIngredients) { ingredient in
                    Text(ingredient.name)
                }
            }
            VStack(alignment: .leading) {
                ForEach(IngredientUnit.allCases, id:\.hashValue) { unit in
                    Text(unit.rawValue.capitalized)
                        .foregroundStyle(selectedUnit == unit ? .blue : .black )
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedUnit = unit                                
                            }
                        }
                }
            }
            Button {
                addIngredient()
            } label: {
                Label("Add Ingredient", systemImage: "plus")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            Button {
                addIngredient()
            } label: {
                Text("New")
                    .font(.footnote)
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)

        }
        .sheet(isPresented: $showNewIngredientForm) {
            
        }
    }
    private func addIngredient() {
//        let newRecipeIngredient = RecipeIngredient(ingredient: <#T##Ingredient#>, quantity: <#T##Float#>, unit: <#T##IngredientUnit#>)
    }
}

#Preview {
    IngredientsField(ingredients: .constant([]))
}
