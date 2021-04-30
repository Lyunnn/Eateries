//
//  EateriesApp.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

@main
struct EateriesApp: App {
    @ObservedObject var restModel: RestViewModel = {
        var restaurant = RestViewModel.model
        var model = RestViewModel()
        model.restModel = restaurant
        return model
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(restaurants: restModel)
        }
    }
    
    static var fileURL: URL {
        let fileName = "eateries.json"
        let fileManager = FileManager.default
        guard let docDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return URL(fileURLWithPath: "/")
        }
        let fileURL = docDirectory.appendingPathComponent(fileName)
        return fileURL
    }
    
    static func save() {
        do {
            let data = try JSONEncoder().encode(RestViewModel.model)
            try data.write(to: fileURL, options: .atomic)
            // dataString to show if the data is saved, to debug
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
