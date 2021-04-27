//
//  ReviewViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

struct ReviewViewModel {
    var reviewModel = [Review]()
    
    mutating func addReview() {
        let newReview = Review(name: "", comment: "")
        reviewModel.append(newReview)
    }
    
    mutating func delReview(at indices: IndexSet) {
        reviewModel.remove(atOffsets: indices)
    }
    
    mutating func moveReview(indices: IndexSet, newOffset: Int) {
        reviewModel.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}
