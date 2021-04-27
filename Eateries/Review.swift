//
//  Review.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

struct Review: Codable, Identifiable {
    
    var id = UUID()
    var name: String
    var comment: String
    
}
