//
//  ReviewList+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 9/5/21.
//
//

import Foundation
import CoreData


extension ReviewList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReviewList> {
        return NSFetchRequest<ReviewList>(entityName: "ReviewList")
    }

    @NSManaged public var reviewModelList: NSObject?
    @NSManaged public var reviews: [String]?
    @NSManaged public var restaurant: Restaurant?

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
