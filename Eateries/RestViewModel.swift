//
//  RestViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation
import SwiftUI
import UIKit

class RestViewModel: ObservableObject, Decodable, Encodable {
    @Published var model: Restaurant
    
    init(model: Restaurant) {
        self.model = model
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case model
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decode(Restaurant.self, forKey: .model)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
    }
    
    var image: Image {
        let emptyImage = Image("nonexistent")
        guard let url = URL(string: model.imgName) else {
            return emptyImage
        }
        // ...download Image
        guard let data = try? Data(contentsOf: url) else {
            return emptyImage
        }
        guard let uiImage = UIImage(data: data) else {
            return emptyImage
        }
        return Image(uiImage: uiImage)
    }
    
}
