//
//  NavigationMeta.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import SwiftUI

struct NavigationMeta: View {
    var title: String
    
    var body: some View {
        EmptyView()
            .navigationTitle(self.title)
    }
}

#Preview {
    NavigationStack {
        NavigationMeta(
            title: "Page title"
        )
    }
}
