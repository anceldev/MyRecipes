//
//  Recipe.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Recipe: Identifiable {
    @Attribute(.unique) var id: UUID
    var title: String
    var desc: String
    var steps: [String]
    var isFavorite: Bool
//    var isPublic: Bool

    @Relationship(inverse: \User.recipes) var user: User?
    @Relationship(deleteRule: .cascade) var ingredients: [RecipeIngredient]
    @Attribute(.externalStorage) var recipeImageData: Data?
    @Transient var recipeImage: Image? {
        guard let data = recipeImageData else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        return Image(uiImage: uiImage)
    }
    
    init(id: UUID = UUID(), title: String, desc: String, steps: [String] = [], isFavorite: Bool = false, user: User? = nil, ingredients: [RecipeIngredient] = [], recipeImageData: Data? = nil) {
        self.id = id
        self.title = title
        self.desc = desc
        self.steps = steps
        self.isFavorite = isFavorite
        self.user = user
        self.ingredients = ingredients
        self.recipeImageData = recipeImageData
    }
}
