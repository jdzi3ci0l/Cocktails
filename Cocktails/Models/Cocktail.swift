//
//  Cocktail.swift
//  Cocktails
//
//  Created by Janusz on 03/05/2022.
//

import Foundation

struct CocktailsResponse: Codable {
    let drinks: [Cocktail]
}

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
    case nonAlcoholic = "Non Alcoholic"
    case optional = "Optional Alcohol"
}

struct Cocktail: Codable {
    let id: String
    let name: String
    let glass: String?
    let instructions: String?
    let imageURL: String?
    private let alcoholic: String?
    private let strCategory: String?
    private let ingredient1: String?
    private let ingredient2: String?
    private let ingredient3: String?
    private let ingredient4: String?
    private let ingredient5: String?
    private let ingredient6: String?
    private let ingredient7: String?
    private let measure1: String?
    private let measure2: String?
    private let measure3: String?
    private let measure4: String?
    private let measure5: String?
    private let measure6: String?
    private let measure7: String?
    
    var alcoholCategory: CocktailAlcoholCategory? {
        guard let alcoholic = alcoholic else {
            return nil
        }
        for category in CocktailAlcoholCategory.allCases {
            if alcoholic.caseInsensitiveCompare(category.rawValue) == .orderedSame {
                return category
            }
        }
        return nil
    }
    
    var category: CocktailCategory? {
        guard let strCategory = strCategory else {
            return nil
        }
        for category in CocktailCategory.allCases {
            if strCategory.caseInsensitiveCompare(category.rawValue) == .orderedSame {
                return category
            }
        }
        return nil
    }
    
    var ingredients: [String] {
        var ingredients: [String] = []
        if let ingredient1 = ingredient1 { ingredients.append(ingredient1) }
        if let ingredient2 = ingredient2 { ingredients.append(ingredient2) }
        if let ingredient3 = ingredient3 { ingredients.append(ingredient3) }
        if let ingredient4 = ingredient4 { ingredients.append(ingredient4) }
        if let ingredient5 = ingredient5 { ingredients.append(ingredient5) }
        if let ingredient6 = ingredient6 { ingredients.append(ingredient6) }
        if let ingredient7 = ingredient7 { ingredients.append(ingredient7) }
        return ingredients
    }
    
    var measures: [String] {
        var measures: [String] = []
        if let measure1 = measure1 { measures.append(measure1) }
        if let measure2 = measure2 { measures.append(measure2) }
        if let measure3 = measure3 { measures.append(measure3) }
        if let measure4 = measure4 { measures.append(measure4) }
        if let measure5 = measure5 { measures.append(measure5) }
        if let measure6 = measure6 { measures.append(measure6) }
        if let measure7 = measure7 { measures.append(measure7) }
        return measures
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case strCategory = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case imageURL = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
    }
}

//MARK: - Example JSON response
/*
 {
 "drinks": [
 {
 "idDrink": "11007",
 "strDrink": "Margarita",
 "strDrinkAlternate": null,
 "strTags": "IBA,ContemporaryClassic",
 "strVideo": null,
 "strCategory": "Ordinary Drink",
 "strIBA": "Contemporary Classics",
 "strAlcoholic": "Alcoholic",
 "strGlass": "Cocktail glass",
 "strInstructions": "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
 "strInstructionsES": null,
 "strInstructionsDE": "Reiben Sie den Rand des Glases mit der Limettenscheibe, damit das Salz daran haftet. Achten Sie darauf, dass nur der äußere Rand angefeuchtet wird und streuen Sie das Salz darauf. Das Salz sollte sich auf den Lippen des Genießers befinden und niemals in den Cocktail einmischen. Die anderen Zutaten mit Eis schütteln und vorsichtig in das Glas geben.",
 "strInstructionsFR": null,
 "strInstructionsIT": "Strofina il bordo del bicchiere con la fetta di lime per far aderire il sale. Avere cura di inumidire solo il bordo esterno e cospargere di sale. Il sale dovrebbe presentarsi alle labbra del bevitore e non mescolarsi mai al cocktail. Shakerare gli altri ingredienti con ghiaccio, quindi versarli delicatamente nel bicchiere.",
 "strInstructionsZH-HANS": null,
 "strInstructionsZH-HANT": null,
 "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
 "strIngredient1": "Tequila",
 "strIngredient2": "Triple sec",
 "strIngredient3": "Lime juice",
 "strIngredient4": "Salt",
 "strIngredient5": null,
 "strIngredient6": null,
 "strIngredient7": null,
 "strIngredient8": null,
 "strIngredient9": null,
 "strIngredient10": null,
 "strIngredient11": null,
 "strIngredient12": null,
 "strIngredient13": null,
 "strIngredient14": null,
 "strIngredient15": null,
 "strMeasure1": "1 1/2 oz ",
 "strMeasure2": "1/2 oz ",
 "strMeasure3": "1 oz ",
 "strMeasure4": null,
 "strMeasure5": null,
 "strMeasure6": null,
 "strMeasure7": null,
 "strMeasure8": null,
 "strMeasure9": null,
 "strMeasure10": null,
 "strMeasure11": null,
 "strMeasure12": null,
 "strMeasure13": null,
 "strMeasure14": null,
 "strMeasure15": null,
 "strImageSource": "https://commons.wikimedia.org/wiki/File:Klassiche_Margarita.jpg",
 "strImageAttribution": "Cocktailmarler",
 "strCreativeCommonsConfirmed": "Yes",
 "dateModified": "2015-08-18 14:42:59"
 }
 ]
 }
 */
