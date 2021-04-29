//
//  Review.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class Review: ObservableObject, Decodable, Encodable {
    
    @Published var name: String
    @Published var comment: String
    
    init(name: String, comment: String) {
        self.name = name
        self.comment = comment
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name
        case comment
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        comment = try container.decode(String.self, forKey: .comment)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(comment, forKey: .comment)

    }
    
}
