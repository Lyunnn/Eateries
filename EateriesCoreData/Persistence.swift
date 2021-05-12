//
//  Persistence.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 9/5/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let restaurantList = RestaurantList(context: viewContext)
        let restaurant = Restaurant(context: viewContext)
        let reviewList = ReviewList(context: viewContext)
        let review = Review(context: viewContext)
        restaurant.imgName = "https://www.insidegoldcoast.com.au/wp-content/uploads/2017/08/DSC_0189-1200x800.jpg"
        restaurant.restName = "BSKT Cafe"
        restaurant.location = "4 Lavarack Rd, GC"
        restaurant.note = "Dog and kid friendly"
        reviewList.reviewArray = [review]
        review.name = "Lin Yun Kee"
        review.comment = "Nice restaurant!"
        restaurantList.restArray = Array(arrayLiteral: restaurant) // [restaurant)]
        let reviewModel = [review.name: "Kyle", review.comment: "Delicious food!"]
        let restModel = [restaurant.imgName: "https://www.insidegoldcoast.com.au/wp-content/uploads/2019/10/504A8731-2-1200x814.jpg", restaurant.restName: "DB Kitchen & Bar", restaurant.location: "1 The Concourse Benowa, GC", restaurant.note: "Start from 7am"]
//        for _ in 1...5 {
//            restaurant.imgName = "https://www.insidegoldcoast.com.au/wp-content/uploads/2017/08/DSC_0189-1200x800.jpg"
//            restaurant.restName = "BSKT Cafe"
//            restaurant.location = "4 Lavarack Rd, GC"
//            restaurant.note = "Dog and kid friendly"
//            reviewList.reviewArray = [review]
//            review.name = "Lin Yun Kee"
//            review.comment = "Nice restaurant!"
//            restaurantList.restArray = Array(arrayLiteral: restaurant) // [restaurant)]
//            let reviewModel = [review.name: "Kyle", review.comment: "Delicious food!"]
//            let restModel = [restaurant.imgName: "https://www.insidegoldcoast.com.au/wp-content/uploads/2019/10/504A8731-2-1200x814.jpg", restaurant.restName: "DB Kitchen & Bar", restaurant.location: "1 The Concourse Benowa, GC", restaurant.note: "Start from 7am", reviewModel]
//        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EateriesCoreData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
