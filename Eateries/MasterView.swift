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
            ForEach(restaurants.restModel) {
                NavigationLink(destination: DetailView(restaurant: $restaurants[identifiedBy: $0]), label: {
                    HStack {
                        Image("\(restaurants.imgName)")
                            .resizable()
                            .frame(width: 70, height: 50)
                        VStack(alignment: .leading) {
                            Text("\(restaurants.restName)")
                                .bold()
                                .font(.callout)
                            Text("\(restaurants.location)")
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

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(restaurants: Binding(get: { EateriesApp.model }, set: { newValue in
//            EateriesApp.model = newValue
//        }))
//    }
//}
