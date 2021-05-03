//
//  EateriesApp.swift
//  Eateries
//
//  Created by Lin Yun Kee on 27/4/21.
//

import SwiftUI

@main
struct EateriesApp: App {
    static var appModel: RestListViewModel = RestListViewModel(modelList: [RestViewModel(model: Restaurant(imgName: "https://www.insidegoldcoast.com.au/wp-content/uploads/2017/08/DSC_0189-1200x800.jpg", restName: "BSKT Cafe", location: "4 Lavarack Rd, GC", note: "Dog and kid friendly", review: [ReviewViewModel(reviews: Review(name: "Lin Yun Kee", comment: "Nice restaurant!"))])), RestViewModel(model: Restaurant(imgName: "https://www.insidegoldcoast.com.au/wp-content/uploads/2019/10/504A8731-2-1200x814.jpg", restName: "DB Kitchen & Bar", location: "1 The Concourse Benowa, GC", note: "Start from 7am", review: [ReviewViewModel(reviews: Review(name: "Kyle", comment: "Delicious food!"))])),
        RestViewModel(model: Restaurant(imgName: "https://b.zmtcdn.com/data/pictures/1/16613961/76fb875422e913f3938c21ff77e02489.jpg", restName: "No Name Lane", location: "GC", note: "Breakfast | Lunch | Bar", review: [ReviewViewModel(reviews: Review(name: "Jason", comment: "Great services!"))]))], titleStr: "Eateries")
    
    static var model: RestListViewModel = {
        guard let data = try? Data(contentsOf: EateriesApp.fileURL),
              let model = try? JSONDecoder().decode(RestListViewModel.self, from: data) else {
            return EateriesApp.appModel }
        return model
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(restaurants: EateriesApp.model)
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
            let data = try JSONEncoder().encode(EateriesApp.model)
            try data.write(to: fileURL, options: .atomic)
            // dataString to show if the data is saved, to debug
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
