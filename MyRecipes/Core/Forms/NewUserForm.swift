//
//  NewUserForm.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftUI

struct NewUserForm: View {
    @Environment(\.modelContext) var modelContext
    @State private var username: String = ""
    @State private var email: String = ""
    var body: some View {
        Form {
            TextField("Username", text: $username)
            TextField("Password", text: $email)
            Button("Add") {
                addUser()
            }
        }
        .navigationTitle("New User")
        .navigationBarTitleDisplayMode(.inline)
    }
    private func addUser() {
        do {
            let newUser = User(username: self.username, email: self.email, recipes: [], friends: [])
            modelContext.insert(newUser)
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
