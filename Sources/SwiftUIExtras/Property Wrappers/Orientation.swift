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
    
    public var wrappedValue: UIDeviceOrientation {
        return coordinator.orientation
    }
    
    public init() { }
    
    class OrientationCoordinator: ObservableObject {
        @Published public var orientation =  UIDevice.current.orientation
        
        init() {
            NotificationCenter.default
                .publisher(for: UIDevice.orientationDidChangeNotification)
                .map { _ in UIDevice.current.orientation }
                .filter(\.isValidInterfaceOrientation)
                .assign(to: &self.$orientation)
        }
    }
}

