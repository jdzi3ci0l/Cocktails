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

struct APICaller {
    static let shared = APICaller()
    
    private init() { }
    
    func getCocktails(containing ingredient: String, completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        guard let url = URL(string: "\(APIConstants.baseURL)/\(APIConstants.key)/filter.php?i=\(ingredient)") else { return }
        
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
    
}
