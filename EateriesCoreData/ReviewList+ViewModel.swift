//
//  ReviewList+ViewModel.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 10/5/21.
//

import Foundation
import CoreData

extension ReviewList {
    
    var reviewArray: [Review] {
        get { reviews?.allObjects as? [Review] ?? [] }
        set { reviews = NSSet(array: newValue) }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func addItem() {
        let newReview = Review(context: viewContext)
        newReview.name = "<New>"
        addToReviews(newReview)

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
        offsets.map { reviewArray[$0] }.forEach(viewContext.delete)

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
