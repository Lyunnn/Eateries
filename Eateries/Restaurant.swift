//
//  Restaurant.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation
import SwiftUI
import UIKit

class Restaurant: ObservableObject, Decodable, Encodable {
    
    @Published var imgURL: URL?
    @Published var imgName: String
    @Published var restName: String
    @Published var location: String
    @Published var note: String
    
    var image: Image {
        let emptyImage = Image("nonexistent")
        guard let url = imgURL else {
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
    
    init(imgName: String, restName: String, location: String, note: String) {
        self.imgName = imgName
        self.restName = restName
        self.location = location
        self.note = note
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case imgURL
        case imgName
        case restName
        case location
        case note
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imgURL = try container.decode(URL.self, forKey: .imgURL)
        imgName = try container.decode(String.self, forKey: .imgName)
        restName = try container.decode(String.self, forKey: .restName)
        location = try container.decode(String.self, forKey: .location)
        note = try container.decode(String.self, forKey: .note)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imgURL, forKey: .imgURL)
        try container.encode(imgName, forKey: .imgName)
        try container.encode(restName, forKey: .restName)
        try container.encode(location, forKey: .location)
        try container.encode(note, forKey: .note)

    }
}
