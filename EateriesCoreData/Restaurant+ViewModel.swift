//
//  Restaurant+ViewModel.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 10/5/21.
//

import Foundation
import SwiftUI
import UIKit
import CoreData

extension Restaurant {
    
    var imgURL: String {
        get { imgName ?? "" }
        set { imgName = newValue }
    }
    var nameStr: String {
        get { restName ?? "" }
        set { restName = newValue }
    }
    var locationStr: String {
        get { location ?? "" }
        set { location = newValue}
    }
    var noteStr: String {
        get { note ?? "" }
        set { note = newValue}
    }
    var image: Image {
        let emptyImage = Image("nonexistent")
        guard let url = URL(string: imgURL) else {
            return emptyImage
        }
        // ...download Image
        guard let data = try? Data(contentsOf: url) else {
            return emptyImage
        }
        guard let uiImage = UIImage(data: data) else {
            return emptyImage
        }
        return Image(uiImage: uiImage)
    }
    
    var reviewArray: [Review] {
        get { reviewArr?.array as? [Review] ?? [] }
        set { reviewArr = NSOrderedSet(array: newValue) }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func addReview() {
        let newReview = Review(context: viewContext)
        newReview.name = "<New>"
        addToReviewArr(newReview)

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func deleteReview(offsets: IndexSet) {
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
