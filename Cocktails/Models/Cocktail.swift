//
//  Cocktail.swift
//  Cocktails
//
//  Created by Janusz on 07/05/2022.
//

import Foundation

enum CocktailCategory: String, CaseIterable {
    case ordinary = "Ordinary Drink"
    case cocktail = "Cocktail"
    case shake = "Shake"
    case other = "Other/Unknown"
    case cocoa = "Cocoa"
    case shot = "Shot"
    case homemadeLiqueur = "Homemade Liqueur"
    case party = "Punch / Party Drink"
    case coffeeOrTea = "Coffee / Tea"
    case beer = "Beer"
    case soft = "Soft Drink"
}

enum CocktailAlcoholCategory: String, CaseIterable {
    case alcoholic = "Alcoholic"
    case nonAlcoholic = "Non alcoholic"
    case optional = "Optional alcohol"
}

struct Cocktail {
    let id: String
    let name: String
    let glass: String
    let instructions: String
    let imageURL: String
    let alcoholCategory: CocktailAlcoholCategory
    let category: CocktailCategory
    var ingredients: [String] = []
    var measures: [String] = []
    
    init(from cocktailData: CocktailData) {
        self.id = cocktailData.id
        self.name = cocktailData.name
        self.glass = cocktailData.glass ?? ""
        self.instructions = cocktailData.instructions ?? ""
        self.imageURL = cocktailData.imageURL ?? ""
        
        if let alcoholCategory = cocktailData.alcoholCategory {
            self.alcoholCategory = CocktailAlcoholCategory(rawValue: alcoholCategory) ?? .alcoholic
        } else {
            self.alcoholCategory = .alcoholic
        }
        
        if let category = cocktailData.category {
            self.category = CocktailCategory(rawValue: category.lowercased()) ?? .other
        } else {
            self.category = .other
        }
        
        if let ingredient1 = cocktailData.ingredient1 { self.ingredients.append(ingredient1) }
        if let ingredient2 = cocktailData.ingredient2 { self.ingredients.append(ingredient2) }
        if let ingredient3 = cocktailData.ingredient3 { self.ingredients.append(ingredient3) }
        if let ingredient4 = cocktailData.ingredient4 { self.ingredients.append(ingredient4) }
        if let ingredient5 = cocktailData.ingredient5 { self.ingredients.append(ingredient5) }
        if let ingredient6 = cocktailData.ingredient6 { self.ingredients.append(ingredient6) }
        if let ingredient7 = cocktailData.ingredient7 { self.ingredients.append(ingredient7) }
        
        if let measure1 = cocktailData.measure1 { self.measures.append(measure1) }
        if let measure2 = cocktailData.measure2 { self.measures.append(measure2) }
        if let measure3 = cocktailData.measure3 { self.measures.append(measure3) }
        if let measure4 = cocktailData.measure4 { self.measures.append(measure4) }
        if let measure5 = cocktailData.measure5 { self.measures.append(measure5) }
        if let measure6 = cocktailData.measure6 { self.measures.append(measure6) }
        if let measure7 = cocktailData.measure7 { self.measures.append(measure7) }
    }
}
