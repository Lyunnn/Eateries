//
//  RestaurantList+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 12/5/21.
//
//

import Foundation
import CoreData


extension RestaurantList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantList> {
        return NSFetchRequest<RestaurantList>(entityName: "RestaurantList")
    }

    @NSManaged public var restaurants: NSSet?

}

// MARK: Generated accessors for restaurants
extension RestaurantList {

    @objc(addRestaurantsObject:)
    @NSManaged public func addToRestaurants(_ value: Restaurant)

    @objc(removeRestaurantsObject:)
    @NSManaged public func removeFromRestaurants(_ value: Restaurant)

    @objc(addRestaurants:)
    @NSManaged public func addToRestaurants(_ values: NSSet)

    @objc(removeRestaurants:)
    @NSManaged public func removeFromRestaurants(_ values: NSSet)

}

extension RestaurantList : Identifiable {

}
