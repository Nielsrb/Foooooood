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
    @State var data: [FoodModel] = []
    
    public func onLoad() {
        Router.getAllData(completion: { data in
            self.data = data
        })
    }
    
    public func onSearch() {
        Router.onSearch(search: search, completion: { data in
            self.data = data
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ListViewHeader(search: $search, onSearch: onSearch)
                    .onAppear(perform: onLoad)
                ListViewList(data: $data)
            }
        }
        .navigationBarTitle("List")
        .padding()
    }
}

struct ListViewHeader: View {
    @Binding var search: String
    var onSearch: () -> ()
    
    var body: some View {
        TextField("Search...", text: $search, onCommit: onSearch)
    }
}

struct ListViewList: View {
    @Binding var data: [FoodModel]
    
    var body: some View {
        List(data) { food in
            Text(food.name)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
