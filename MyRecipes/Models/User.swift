//
//  User.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    @Attribute(.unique) var id: UUID
    var username: String
    var email: String
    
    @Relationship(deleteRule: .nullify) var recipes: [Recipe]
    @Relationship(deleteRule: .noAction) var friends: [User]
    
    init(id: UUID = UUID(), username: String, email: String, recipes: [Recipe] = [], friends: [User] = []) {
        self.id = id
        self.username = username
        self.email = email
        self.recipes = recipes
        self.friends = friends
    }
}

extension User {
    static var preview = User(username: "ancel", email: "ancel@mail.com", recipes: [], friends: [])
}
