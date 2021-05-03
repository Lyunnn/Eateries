//
//  NavTitle.swift
//  Eateries
//
//  Created by Lin Yun Kee on 3/5/21.
//

import Foundation

class NavTitle: ObservableObject, Decodable, Encodable {
    
    @Published var titleStr: String
    
    init(titleStr: String) {
        self.titleStr = titleStr
    }
    
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case titleStr
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        titleStr = try container.decode(String.self, forKey: .titleStr)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(titleStr, forKey: .titleStr)
    }
    
}
