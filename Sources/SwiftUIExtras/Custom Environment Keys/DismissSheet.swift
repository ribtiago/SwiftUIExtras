//
//  DismissSheet.swift
//  
//
//  Created by Tiago Ribeiro on 31/08/2022.
//

import SwiftUI


struct DismissSheetKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

public extension EnvironmentValues {
    var dismissSheet: Binding<Bool> {
        get {
            return self[DismissSheetKey.self]
        }
        set {
            self[DismissSheetKey.self] = newValue
        }
    }
}
