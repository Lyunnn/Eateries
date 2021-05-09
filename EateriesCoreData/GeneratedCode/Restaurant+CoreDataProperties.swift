//
//  Restaurant+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 9/5/21.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var imgName: String?
    @NSManaged public var location: String?
    @NSManaged public var note: String?
    @NSManaged public var restName: String?
    @NSManaged public var review: [String]?
    @NSManaged public var restList: RestaurantList?

}

// MARK: Generated accessors for review
extension Restaurant {

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: ReviewList)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: ReviewList)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSSet)

}

extension Restaurant : Identifiable {

}
