//
//  MasterView.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

struct MasterView: View {
    @Binding var restaurants: [Restaurant]
    var body: some View {
        List(0..<restaurants.count) { r in
            DetailView(restaurant: $restaurants[r])
        }
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}
