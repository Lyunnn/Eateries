//
//  RestaurantList+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 13/5/21.
//
//

import Foundation
import CoreData


extension RestaurantList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantList> {
        return NSFetchRequest<RestaurantList>(entityName: "RestaurantList")
    }

    @NSManaged public var listName: String?
    @NSManaged public var titleName: String?
    @NSManaged public var restaurants: NSOrderedSet?

}

// MARK: Generated accessors for restaurants
extension RestaurantList {

    @objc(insertObject:inRestaurantsAtIndex:)
    @NSManaged public func insertIntoRestaurants(_ value: Restaurant, at idx: Int)

    @objc(removeObjectFromRestaurantsAtIndex:)
    @NSManaged public func removeFromRestaurants(at idx: Int)

    @objc(insertRestaurants:atIndexes:)
    @NSManaged public func insertIntoRestaurants(_ values: [Restaurant], at indexes: NSIndexSet)

    @objc(removeRestaurantsAtIndexes:)
    @NSManaged public func removeFromRestaurants(at indexes: NSIndexSet)

    @objc(replaceObjectInRestaurantsAtIndex:withObject:)
    @NSManaged public func replaceRestaurants(at idx: Int, with value: Restaurant)

    @objc(replaceRestaurantsAtIndexes:withRestaurants:)
    @NSManaged public func replaceRestaurants(at indexes: NSIndexSet, with values: [Restaurant])

    @objc(addRestaurantsObject:)
    @NSManaged public func addToRestaurants(_ value: Restaurant)

    @objc(removeRestaurantsObject:)
    @NSManaged public func removeFromRestaurants(_ value: Restaurant)

    @objc(addRestaurants:)
    @NSManaged public func addToRestaurants(_ values: NSOrderedSet)

    @objc(removeRestaurants:)
    @NSManaged public func removeFromRestaurants(_ values: NSOrderedSet)

}
