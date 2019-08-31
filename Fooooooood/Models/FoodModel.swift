//
//  FoodModel.swift
//  Fooooooood
//
//  Created by Niels Beeuwkes on 31/08/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import Foundation

struct FoodModel: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let ingredients: String
}
