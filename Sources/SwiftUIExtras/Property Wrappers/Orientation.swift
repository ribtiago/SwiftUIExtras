//
//  Orientation.swift
//  
//
//  Created by Tiago Ribeiro on 07/03/2023.
//

import SwiftUI
import Combine

@propertyWrapper public struct Orientation: DynamicProperty {
    
    @StateObject private var coordinator = OrientationCoordinator()
    
    public var wrappedValue: UIInterfaceOrientation {
        return coordinator.orientation
    }
    
    public init() { }
    
    class OrientationCoordinator: ObservableObject {
        @Published public var orientation =  UIApplication.shared.windows
            .first?
            .windowScene?
            .interfaceOrientation ?? .portrait
        
        init() {
            NotificationCenter.default
                .publisher(for: UIDevice.orientationDidChangeNotification)
                .map { _ in UIDevice.current.orientation }
                .filter(\.isValidInterfaceOrientation)
                .map { _ in
                    UIApplication.shared.windows
                        .first?
                        .windowScene?
                        .interfaceOrientation
                }
                .replaceNil(with: .portrait)
                .assign(to: &self.$orientation)
        }
    }
}

