//
//  APICaller.swift
//  Cocktails
//
//  Created by Janusz on 03/05/2022.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://www.thecocktaildb.com/api/json/v1"
    
    //Using the developer test key '1' as the API key
    static let key = "1"
}

enum APIError: Error {
    case failedToGetData
}

enum CocktailCategory: String {
    case ordinary = "Ordinary_Drink"
    case cocktail = "Cocktail"
    case shake = "Shake"
    case other = "Other/Unknown"
    case cocoa = "Cocoa"
    case shot = "Shot"
    case homemadeLiqueur = "Homemade_Liqueur"
    case party = "Punch_/_Party_Drink"
    case coffeeOrTea = "Coffee_/_Tea"
    case beer = "Beer"
    case soft = "Soft_Drink"
}

enum CocktailAlcoholCategory: String {
    case alcoholic = "Alcoholic"
    case nonAlcoholic = "Non_Alcoholic"
    case optional = "Optional_Alcohol"
}

struct APICaller {
    static let shared = APICaller()
    
    private init() { }
    
    private func getCocktails(fromURL url: URL, completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decoded = try JSONDecoder().decode(CocktailsResponse.self, from: data)
                completion(.success(decoded.drinks))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func getCocktailDetails(fromURL url: URL, completion: @escaping (Result<Cocktail, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decoded = try JSONDecoder().decode(CocktailsResponse.self, from: data)
                if let cocktail = decoded.drinks.first {
                    completion(.success(cocktail))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getCocktails(containing ingredient: String, completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/\(APIConstants.key)/filter.php?i=\(ingredient)") else { return }
        
        getCocktails(fromURL: url, completion: completion)
    }
    
    func getCocktails(byCategory category: CocktailCategory, completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/\(APIConstants.key)/filter.php?c=\(category.rawValue)") else { return }
        
        getCocktails(fromURL: url, completion: completion)
    }
    
    func getCocktails(byAlcoholCategory category: CocktailAlcoholCategory, completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/\(APIConstants.key)/filter.php?a=\(category.rawValue)") else { return }
        
        getCocktails(fromURL: url, completion: completion)
    }
    
    func getCocktailDetails(byID id: String, completion: @escaping (Result<Cocktail, Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/\(APIConstants.key)/lookup.php?i=\(id)") else { return }
        
        getCocktailDetails(fromURL: url, completion: completion)
    }
}
