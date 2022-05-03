//
//  APICaller.swift
//  Cocktails
//
//  Created by Janusz on 03/05/2022.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://www.thecocktaildb.com/api/json/v1/"
    
    //Using the developer test key '1' as the API key
    static let key = "1"
}

struct APICaller {
    static let shared = APICaller()
    
    private init() { }
}
