//
//  ReviewViewModel.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import Foundation

class ReviewViewModel: ObservableObject {
    @Published var reviewModel = [Review]()
    
    func addReview() {
        let newReview = Review(name: "", comment: "")
        reviewModel.append(newReview)
    }
    
    func delReview(at indices: IndexSet) {
        reviewModel.remove(atOffsets: indices)
    }
    
    func moveReview(indices: IndexSet, newOffset: Int) {
        reviewModel.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}
