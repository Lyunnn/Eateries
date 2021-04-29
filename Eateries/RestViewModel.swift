//
//  RestViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class RestViewModel: ObservableObject {
    @Published var restModel = [Restaurant]()
    
    static var model: [Restaurant] = {
        guard let data = try? Data(contentsOf: EateriesApp.fileURL),
              let model = try? JSONDecoder().decode([Restaurant].self, from: data) else {
            return [Restaurant(imgName: "BSKT", restName: "BSKT Cafe", location: "4 Lavarack Rd, GC", note: ""),
                    Restaurant(imgName: "dbKitchen", restName: "DB Kitchen & Bar", location: "1 The Concourse Benowa, GC", note: ""),
                    Restaurant(imgName: "NoNameLane", restName: "No Name Lane", location: "GC", note: "")]
        }
        return model
    }()

    func addRest() {
        let newFood = Restaurant(imgName: "", restName: "<New>", location: "", note: "")
        restModel.append(newFood)
    }

    func delRest(at indices: IndexSet) {
        restModel.remove(atOffsets: indices)
    }

    func moveRest(indices: IndexSet, newOffset: Int) {
        restModel.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}
