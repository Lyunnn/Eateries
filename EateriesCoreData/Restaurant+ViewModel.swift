//
//  Restaurant+ViewModel.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 10/5/21.
//

import Foundation
import SwiftUI
import UIKit

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
    
}
