//
//  RecipesList.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 20/11/24.
//

import SwiftData
import SwiftUI

struct RecipesList: View {
    var user: User
    @Query var recipes: [Recipe]
    @State private var showRecipeForm: Bool = false
    
//    init(user: User) {
//        self.user = user
//        self._recipes = Query(filter: #Predicate<Recipe>{ $0.user == user })
//        self._showRecipeForm = State(initialValue: false)
//    }
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Recipes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showRecipeForm.toggle()
                } label: {
                    Label("Add recipe", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showRecipeForm) {
            Text("New Recipe")
        }
    }
}

#Preview {
    NavigationStack {
        RecipesList(user: User.preview)
    }
}
