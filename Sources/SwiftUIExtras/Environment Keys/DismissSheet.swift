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
    
    @available(*, deprecated, renamed: "dismissSheetAction", message: "Use the `dismissSheetAction` environment variable instead.")
    var dismissSheet: Binding<Bool> {
        get {
            return self[DismissSheetKey.self]
        }
        set {
            self[DismissSheetKey.self] = newValue
        }
    }
    
    @available(iOS 15.0, *)
    @Entry var dismissSheetAction: DismissAction = EnvironmentValues().dismiss
}
