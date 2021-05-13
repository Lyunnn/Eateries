//
//  RestList+ViewModel.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 10/5/21.
//

import Foundation
import CoreData

extension RestaurantList {
    
    var restArray: [Restaurant] {
        get { restaurants?.array as? [Restaurant] ?? [] }
        set { restaurants = NSOrderedSet(array: newValue) }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func addItem() {
        let newRestaurant = Restaurant(context: viewContext)
        newRestaurant.restName = "<New>"
        addToRestaurants(newRestaurant)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func deleteItems(offsets: IndexSet) {
        offsets.map { restArray[$0] }.forEach(viewContext.delete)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
