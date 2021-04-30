//
//  MasterView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var restaurants: RestViewModel
    var body: some View {
        List {
            ForEach(restaurants.restModel, id: \.imgName) { restaurant in
                NavigationLink(destination: DetailView(restaurant: restaurant)
                                .navigationBarItems(trailing: EditButton())
                               , label: {
                    HStack {
                        Image("\(restaurant.imgName)")
                            .resizable()
                            .frame(width: 70, height: 50)
                        VStack(alignment: .leading) {
                            Text("\(restaurant.restName)")
                                .bold()
                                .font(.callout)
                            Text("\(restaurant.location)")
                                .font(.callout)
                        }
                    }
                })
            }
            .onDelete(perform: restaurants.delRest)
            .onMove(perform: restaurants.moveRest)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(restaurants: RestViewModel())
    }
}
