//
//  ContentView.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 9/5/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RestaurantList.restaurants, ascending: true)],
        animation: .default)
    private var restaurants: FetchedResults<RestaurantList>

    var body: some View {
        NavigationView {
            MasterView(restaurantList: RestaurantList(context: viewContext))
                .navigationTitle("Eateries")
        }
    }


}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
