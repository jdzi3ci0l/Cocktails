//
//  DataPersistenceManager.swift
//  Cocktails
//
//  Created by Janusz on 08/05/2022.
//

import Foundation
import OrderedCollections

struct DataPersistenceManager {
    static var shared = DataPersistenceManager()
    
    private let userDefaults = UserDefaults.standard
    
    private init() {
        if let data = userDefaults.data(forKey: favouritesSaveKey)  {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                favouriteCocktailsIDs = decoded
                return
            }
        }
        favouriteCocktailsIDs = []
    }
    
    private(set) var favouriteCocktailsIDs: Set<String>
    
    private let favouritesSaveKey = "Favourites"
    
    mutating func switchFavourite(cocktailID id: String) -> Bool {
        var favourited: Bool
        if favouriteCocktailsIDs.contains(id) {
            favouriteCocktailsIDs.remove(id)
            favourited = false
        } else {
            favouriteCocktailsIDs.insert(id)
            favourited = true
        }
        save()
        return favourited
    }
    
    private func save() {
        do {
        let encoded = try JSONEncoder().encode(favouriteCocktailsIDs)
        userDefaults.set(encoded, forKey: favouritesSaveKey)
        } catch {
            print("Failed to save data")
        }
    }
}
