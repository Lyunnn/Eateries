//
//  Restaurant.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class Restaurant: ObservableObject, Decodable, Encodable {
    
    @Published var imgName: String
    @Published var restName: String
    @Published var location: String
    @Published var note: String
    @Published var review: Array<ReviewViewModel>
    
    init(imgName: String, restName: String, location: String, note: String, review: Array<ReviewViewModel>) {
        self.imgName = imgName
        self.restName = restName
        self.location = location
        self.note = note
        self.review = review
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case imgName
        case restName
        case location
        case note
        case review
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imgName = try container.decode(String.self, forKey: .imgName)
        restName = try container.decode(String.self, forKey: .restName)
        location = try container.decode(String.self, forKey: .location)
        note = try container.decode(String.self, forKey: .note)
        review = try container.decode(Array<ReviewViewModel>.self, forKey: .review)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imgName, forKey: .imgName)
        try container.encode(restName, forKey: .restName)
        try container.encode(location, forKey: .location)
        try container.encode(note, forKey: .note)
        try container.encode(review, forKey: .review)
    }
    
}
