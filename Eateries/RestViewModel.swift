//
//  RestViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation
import SwiftUI

class RestViewModel: ObservableObject {
    @Published var restModel = [Restaurant]()

    func addRest() {
        let newFood = Restaurant(imgName: "", restName: "<New>", location: "")
        restModel.append(newFood)
    }

    func delRest(at indices: IndexSet) {
        restModel.remove(atOffsets: indices)
    }

    func moveRest(indices: IndexSet, newOffset: Int) {
        restModel.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}
