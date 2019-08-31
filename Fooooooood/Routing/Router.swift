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
        FoodModel(name: "Hamburger", id: 0),
        FoodModel(name: "Kaasbal", id: 1),
        FoodModel(name: "Gehaktbal", id: 2),
        FoodModel(name: "Appelmoes", id: 3)
    ]
    
    static let shared = Router()
    
    static func getAllData(completion: ([FoodModel]) -> ()) {
        completion(food)
    }
    
    static func onSearch(search: String, completion: ([FoodModel]) -> ()) {
        guard search != "" else {
            completion(food)
            return
        }
        
        completion(food.filter { $0.name.lowercased().contains(search.lowercased()) })
    }
}
