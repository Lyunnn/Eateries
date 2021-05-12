//
//  ReviewList+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 12/5/21.
//
//

import Foundation
import CoreData


extension ReviewList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReviewList> {
        return NSFetchRequest<ReviewList>(entityName: "ReviewList")
    }

    @NSManaged public var restaurant: Restaurant?
    @NSManaged public var reviews: NSSet?

}

// MARK: Generated accessors for reviews
extension ReviewList {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension ReviewList : Identifiable {

}
