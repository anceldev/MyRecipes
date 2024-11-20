//
//  Ingredient.swift
//  MyRecipes
//
//  Created by Ancel Dev account on 19/11/24.
//

import SwiftUI
import SwiftData

@Model
class RecipeIngredient {
    @Attribute(.unique) var id: UUID
    @Relationship(inverse: \Recipe.ingredients) var recipe: Recipe?
    @Relationship(deleteRule: .noAction) var ingredient: Ingredient
    var quantity: Float
    var unit: IngredientUnit
    
    init(id: UUID = UUID(), recipe: Recipe? = nil, ingredient: Ingredient, quantity: Float, unit: IngredientUnit) {
        self.id = id
        self.recipe = recipe
        self.ingredient = ingredient
        self.quantity = quantity
        self.unit = unit
    }
}


enum IngredientUnit: String, CaseIterable, Codable {
    case g = "gramos"
    case l = "litros"
    case cup = "cup"
}

@Model
class Ingredient {
    @Attribute(.unique) var id: UUID
    var name: String
    @Attribute(.externalStorage) var ingredientImageData: Data?
    @Transient var ingredientImage: Image? {
        guard let data = ingredientImageData else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        return Image(uiImage: uiImage)
    }
    
    init(id: UUID = UUID(), name: String, ingredientImageData: Data? = nil) {
        self.id = id
        self.name = name
        self.ingredientImageData = ingredientImageData
    }
}
