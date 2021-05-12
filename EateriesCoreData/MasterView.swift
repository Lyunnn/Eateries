//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 9/5/21.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var restaurant: Restaurant
    var body: some View {
        HStack {
            restaurant.image
                .resizable()
                .frame(width: 80, height: 60)
            VStack(alignment: .leading) {
                Text("\(restaurant.nameStr)")
                    .bold()
                    .font(.callout)
                Text("\(restaurant.locationStr)")
                    .font(.callout)
            }
        }
    }
}

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var restaurantList: RestaurantList
    var body: some View {
        List {
            ForEach(restaurantList.restArray) { restaurant in
                NavigationLink(destination: DetailView(restaurant: restaurant), label: {
                    RowView(restaurant: restaurant)
                })
            }
            .onDelete(perform: withAnimation { restaurantList.deleteItems } )
        }
        .navigationBarItems(
            leading: EditButton(),
            trailing: Button(action: { withAnimation {/*add new list item*/ restaurantList.addItem() } }, label: { Image(systemName: "plus") })
        )
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}
