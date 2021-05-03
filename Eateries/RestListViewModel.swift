//
//  RestListViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class RestListViewModel: ObservableObject, Decodable, Encodable {
    @Published var modelList: Array<RestViewModel>
    
    init(modelList: Array<RestViewModel>) {
        self.modelList = modelList
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case modelList
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        modelList = try container.decode(Array<RestViewModel>.self, forKey: .modelList)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modelList, forKey: .modelList)
    }
    
    func addRest() {
        let newFood = RestViewModel(model: Restaurant(imgName: "", restName: "<New>", location: "Enter location", note: "Enter notes", review: [ReviewViewModel(reviews: Review(name: "", comment: ""))]))
        modelList.append(newFood)
        EateriesApp.save()
    }

    func delRest(at indices: IndexSet) {
        modelList.remove(atOffsets: indices)
        EateriesApp.save()
    }

    func moveRest(indices: IndexSet, newOffset: Int) {
        modelList.move(fromOffsets: indices, toOffset: newOffset)
        EateriesApp.save()
    }
}
