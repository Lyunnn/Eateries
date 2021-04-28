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
    
    extension RestViewModel where restModel: MutableCollection, restModel.Restaurant: Identifiable {
        /// Subscript for a given, identifiable element
        subscript(identifiedBy element: RestViewModel.restModel) -> Binding<RestViewModel.restModel> {
            return Binding<RestViewModel.restModel>(get: {
                return wrappedValue.first { $0.id == element.id } ?? element
            }, set: { newValue in
                guard let i = wrappedValue.firstIndex(where: { $0.id == element.id }) else { return }
                wrappedValue[i] = newValue
            })
        }
    }
}
