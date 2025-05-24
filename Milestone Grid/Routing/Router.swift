//
//  Router.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import Foundation
import SwiftUI
import Observation

/// Global class for handling routing
@Observable
class Router {
    var path = NavigationPath()
    
    /// Navigates to certain page
    func navigate(_ appendingPath: Route) {
        path.append(appendingPath)
    }
    
    /// Navigates one route back
    func goBack() {
        path.removeLast(1)
    }
    
    /// Goes back to root page
    func popToRoot() {
        path.removeLast(path.count)
    }
}
