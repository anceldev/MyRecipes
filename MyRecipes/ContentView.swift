//
//  ContentView.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var user: [User]
    @State private var newUserForm = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(user) { user in
                        NavigationLink(value: user) {
                            Text(user.username)
                        }
                    }}
            }
            .navigationDestination(for: User.self) { user in
                RecipesList(user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        newUserForm.toggle()
                    } label: {
                        Label("Add User", systemImage: "plus")
                            .labelStyle(.iconOnly)
                    }
                    
                }
            }
            .navigationTitle("Select User")
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(.gray)
        .sheet(isPresented: $newUserForm) {
            NewUserForm()
        }
        .onAppear {
            print("Entra")
            print(URL.applicationSupportDirectory.path(percentEncoded: false))
        }
    }
}

#Preview {
    let preview = Preview(User.self, Recipe.self, RecipeIngredient.self, Ingredient.self)
        preview.addExamples([User.preview])
    return NavigationStack {
        ContentView()
            .modelContainer(preview.container)
    }
}
