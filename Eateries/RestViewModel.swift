//
//  RestViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

struct RestViewModel: Codable {
    var restModel = [Restaurant]()
    
    mutating func addRest() {
        let newFood = Restaurant(imgName: "", restName: "<New>", location: "")
        restModel.append(newFood)
    }
    
    mutating func delRest(at indices: IndexSet) {
        restModel.remove(atOffsets: indices)
    }
    
    mutating func moveRest(indices: IndexSet, newOffset: Int) {
        restModel.move(fromOffsets: indices, toOffset: newOffset)
    }
}
