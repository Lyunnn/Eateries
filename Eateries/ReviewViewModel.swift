//
//  ReviewViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class ReviewViewModel: ObservableObject {
    @Published var reviewModel = [Review]()
    
    static var model: [Review] = {
        guard let data = try? Data(contentsOf: EateriesApp.fileURL),
              let model = try? JSONDecoder().decode([Review].self, from: data) else {
            return [Review(name: "Lyun", comment: "Nice restaurant!"),
                    Review(name: "Kyle", comment: "Delicious food!")]
        }
        return model
    }()
    
}
