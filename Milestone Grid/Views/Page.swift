//
//  Page.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import SwiftUI
import XenopompEssentials

struct Page<Content: View>: View {
    var title: String
    var titleDisplayMode: NavigationBarItem.TitleDisplayMode
    @ViewBuilder let content: Content
    
    var body: some View {
        ScrollView {
            HStack {
                Group {
                    content
                }
                Spacer()
            }
            .padding()
            .shrink(at: .width)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(titleDisplayMode)
    }
}

#Preview {
    Group {
        Page(
            title: "Sample page",
            titleDisplayMode: .large
        ) {
            Text("Hello sample page!")
        }
    }
    .withRouter()
}
