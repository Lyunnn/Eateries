//
//  Review+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 9/5/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var comment: String?
    @NSManaged public var name: String?
    @NSManaged public var reviewList: ReviewList?

}

extension Review : Identifiable {

}
