//
//  Binding+Identifiable.swift
//  Eateries
//
//  Created by Lin Yun Kee on 28/4/21.
//

import SwiftUI

extension Binding where Value: MutableCollection, Value.Element: Identifiable {
    /// Subscript for a given, identifiable element
    subscript(identifiedBy element: Value.Element) -> Binding<Value.Element> {
        return Binding<Value.Element>(get: {
            return wrappedValue.first { $0.id == element.id } ?? element
        }, set: { newValue in
            guard let i = wrappedValue.firstIndex(where: { $0.id == element.id }) else { return }
            wrappedValue[i] = newValue
        })
    }
}
