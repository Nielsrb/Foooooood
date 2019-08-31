//
//  ListView.swift
//  Fooooooood
//
//  Created by Niels Beeuwkes on 31/08/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @State var search: String = ""
    @State var data: [FoodModel] = [FoodModel(name: "Sate", id: 0), FoodModel(name: "Ramen", id: 1), FoodModel(name: "Hamburger", id: 2)]
    
    public func onSearch() {
        print(search)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ListViewHeader(search: $search, data: $data, onSearch: onSearch)
                Spacer()
            }
        }
        .navigationBarTitle("List")
        .padding()
    }
}

struct ListViewHeader: View {
    @Binding var search: String
    @Binding var data: [FoodModel]
    var onSearch: () -> ()
    
    var body: some View {
        VStack {
            TextField("Search...", text: $search, onCommit: onSearch)
            List(data) { food in
                Text(food.name)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
