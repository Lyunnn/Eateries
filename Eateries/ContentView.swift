//
//  ContentView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

//struct TitleEdit: View {
//    @ObservedObject var name: NavTitle
//    var navTitle: some View {
//        let str = TextField("Eateries", text: $name.titleStr, onCommit: {
//            EateriesApp.save()
//        })
//        return str
//    }
//    var body: some View {
//        navTitle
//    }
//}

struct ContentView: View {
    @Environment(\.editMode) var editMode
    @ObservedObject var restaurants: RestListViewModel
    var editor: Bool {
        return editMode?.wrappedValue.isEditing ?? false ? true : false
    }
//    var title: some View {
//        let str = TextField("Eateries", text: $restaurants.titleStr, onCommit: {
//            EateriesApp.save()
//        })
//        return str
//    }
//    var title = TextField("Eateries", text: $restaurants.titleStr.self, onCommit: {
//                    EateriesApp.save()
//    })
    var body: some View {
        if editor {
            NavigationView {
                MasterView(restaurants: restaurants)
                    .navigationTitle("\(restaurants.titleStr)")
                    // .navigationTitle(title)
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing: Button(action: { withAnimation {/*add new list item*/ restaurants.addRest()} }, label: { Image(systemName: "plus") })
                    )
            }
        } else {
            NavigationView {
                MasterView(restaurants: restaurants)
                    .navigationTitle("\(restaurants.titleStr)")
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing: Button(action: { withAnimation {/*add new list item*/ restaurants.addRest()} }, label: { Image(systemName: "plus") })
                    )
            }
        }
    }
    func navigationTitle<S>(str: S) -> some View where S : StringProtocol {
        let str = TextField("Eateries", text: $restaurants.titleStr, onCommit: {
            EateriesApp.save()
        })
        return str
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(restaurants: RestListViewModel(modelList: [RestViewModel(model: Restaurant(imgName: "", restName: "", location: "", note: "", review: [ReviewViewModel(reviews: Review(name: "", comment: ""))]))], titleStr: ""))
    }
}
