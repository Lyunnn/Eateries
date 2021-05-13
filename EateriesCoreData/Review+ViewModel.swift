//
//  Review+ViewModel.swift
//  EateriesCoreData
//
//  Created by Lin Yun Kee on 10/5/21.
//

import Foundation

extension Review {
    
    var nameStr: String {
        get { name ?? "" }
        set { name = newValue }
    }
    var commentStr: String {
        get { comment ?? "" }
        set { comment = newValue }
    }
    
}
