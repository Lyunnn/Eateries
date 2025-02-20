//
//  RestListViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class RestListViewModel: ObservableObject, Decodable, Encodable {
    @Published var modelList: Array<RestViewModel>
    @Published var titleStr: String
    
    init(modelList: Array<RestViewModel>, titleStr: String) {
        self.modelList = modelList
        self.titleStr = titleStr
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case modelList
        case titleStr
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        modelList = try container.decode(Array<RestViewModel>.self, forKey: .modelList)
        titleStr = try container.decode(String.self, forKey: .titleStr)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(modelList, forKey: .modelList)
        try container.encode(titleStr, forKey: .titleStr)
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
