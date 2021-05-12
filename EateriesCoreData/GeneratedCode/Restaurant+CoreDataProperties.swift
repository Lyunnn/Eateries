//
//  Restaurant+CoreDataProperties.swift
//  Eateries
//
//  Created by Lin Yun Kee on 12/5/21.
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
    @NSManaged public var restList: RestaurantList?
    @NSManaged public var reviewArr: ReviewList?

}

extension Restaurant : Identifiable {

}
