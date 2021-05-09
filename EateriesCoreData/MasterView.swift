//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 9/5/21.
//

import SwiftUI

struct MasterView: View {
    var body: some View {
        List {
            ForEach(items) { item in
                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
