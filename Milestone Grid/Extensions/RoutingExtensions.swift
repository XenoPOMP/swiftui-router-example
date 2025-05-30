//
//  RoutingExtensions.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import Foundation
import SwiftUI

struct RouterViewModifier: ViewModifier {
    @State private var router = Router()
    
    /// This method contains all routes
    private func routeView(for route: Route) -> some View {
        Group {
            switch route {
            case .milestone(let data): MilestonePage(item: data)
            }
        }
        .environment(router)
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    routeView(for: route)
                }
        }
    }
}

extension View {
    /// Wraps view with Router
    func withRouter() -> some View {
        modifier(RouterViewModifier())
    }
}
