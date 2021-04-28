//
//  Restaurant.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

struct Restaurant: Codable, Identifiable {
    
    var id = UUID()
    var imgURL: URL?
    var imgName: String
    var restName: String
    var location: String
//    var note: String
//    var review: [Review]

}
