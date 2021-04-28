//
//  DeatailView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.editMode) var editMode
    @ObservedObject var restaurant: Restaurant
    var body: some View {
        List {
            Section {
                TextField("Enter image url", text: $restaurant.imgName, onCommit:  {
                    EateriesApp.save()
                })
            }
            Section {
                TextField("Enter restaurant name", text: $restaurant.restName, onCommit:  {
                    EateriesApp.save()
                })
            }
            Section {
                TextField("Enter location", text: $restaurant.location, onCommit:  {
                    EateriesApp.save()
                })
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
