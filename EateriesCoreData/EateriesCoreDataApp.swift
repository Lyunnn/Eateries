//
//  EateriesCoreDataApp.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 9/5/21.
//

import SwiftUI

@main
struct EateriesCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
