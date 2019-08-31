//
//  Router.swift
//  Fooooooood
//
//  Created by Niels Beeuwkes on 31/08/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import Foundation


final class Router {
    
    private static let food = [
        FoodModel(id: 0, name: "Hamburger", description: "", ingredients: ""),
        FoodModel(id: 1, name: "Kaasbal", description: "", ingredients: ""),
        FoodModel(id: 2, name: "Gehaktbal", description: "", ingredients: ""),
        FoodModel(id: 3, name: "Appelmoes", description: "", ingredients: "")
    ]
    
    static let shared = Router()
    
    static func getAllData(completion: ([FoodModel]) -> ()) {
        completion(food)
    }
    
    static func getDataFor(id: Int, completion: (FoodModel?) -> ()) {
        completion(food.first(where: { $0.id == id }))
    }
    
    static func onSearch(search: String, completion: ([FoodModel]) -> ()) {
        guard search != "" else {
            completion(food)
            return
        }
        
        completion(food.filter { $0.name.lowercased().contains(search.lowercased()) })
    }
}
