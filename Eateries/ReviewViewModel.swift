//
//  ReviewViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class ReviewViewModel: ObservableObject, Decodable, Encodable {
    @Published var reviews: Review
    
    init(reviews: Review) {
        self.reviews = reviews
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case reviews
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        reviews = try container.decode(Review.self, forKey: .reviews)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(reviews, forKey: .reviews)
    }
    
}
