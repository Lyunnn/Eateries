//
//  ContentView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

//var modify = RestViewModel()
struct ContentView: View {
    @ObservedObject var restaurants: RestViewModel
    var body: some View {
        NavigationView {
            MasterView(restaurants: restaurants)
                .navigationTitle("Eateries")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: { withAnimation {/*add new list item*/ restaurants.addRest()} }, label: { Image(systemName: "plus") })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(restaurants: RestViewModel())
//        ContentView(restaurants: Binding(get: { RestViewModel.model }, set: { newValue in
//            RestViewModel.model = newValue
//        }))
    }
}
