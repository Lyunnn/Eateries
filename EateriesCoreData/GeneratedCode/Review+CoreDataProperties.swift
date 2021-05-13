//
//  Review+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 13/5/21.
//
//

import Foundation
import CoreData


extension Review: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var comment: String?
    @NSManaged public var name: String?
    @NSManaged public var reviewList: Restaurant?

}
