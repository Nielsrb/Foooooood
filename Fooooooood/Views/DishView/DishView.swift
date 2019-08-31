//
//  DishView.swift
//  Fooooooood
//
//  Created by Niels Beeuwkes on 31/08/2019.
//  Copyright © 2019 Niels Beeuwkes. All rights reserved.
//

import SwiftUI

struct DishView: View {
    @State var data: FoodModel?
    var id: Int
    
    func onLoad() {
        Router.getDataFor(id: id, completion: { data in
            if let data = data {
                self.data = data
            }
        })
    }
    
    var body: some View {
        VStack {
            Text(data?.name ?? "Loading...").onAppear(perform: onLoad)
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(id: 0)
    }
}
