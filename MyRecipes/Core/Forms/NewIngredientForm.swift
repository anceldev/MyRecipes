//
//  NewIngredientForm.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 20/11/24.
//

import SwiftUI

struct NewIngredientForm: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var showAlert = false
    @State private var alertMessage = "No se ha podido añadir el nuevo ingrediente"
    var body: some View {
        Form {
            TextField("New Ingredient", text: $name)
            Button {
                addNewIngredient()
                dismiss()
            } label: {
                Text("Add")
                    .font(.footnote)
            }
            .buttonStyle(.borderedProminent)
            .frame(alignment: .center)
            
        }
        .navigationTitle("Add New Ingredient")
        .navigationBarTitleDisplayMode(.inline)
    }
    private func addNewIngredient() {
        do {
            let newIngredient = Ingredient(name: name)
            modelContext.insert(newIngredient)
            try modelContext.save()
        } catch {
            showAlert = true
            print(error.localizedDescription)
        }
    }
}
