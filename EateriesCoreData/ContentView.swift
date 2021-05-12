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
    @ObservedObject var restaurantList: RestaurantList

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RestaurantList.restArray, ascending: true)],
        animation: .default)
    private var restaurants: FetchedResults<RestaurantList>

    var body: some View {
        NavigationView {
            MasterView()
                .navigationTitle("Eateries")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: { withAnimation {/*add new list item*/ restaurantList.addItem() } }, label: { Image(systemName: "plus") })
                )
        }
    }


}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
