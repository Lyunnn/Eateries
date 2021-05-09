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
    }
}
