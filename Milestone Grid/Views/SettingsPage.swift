//
//  SettingsPage.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        Page(title: "Settings", titleDisplayMode: .large) {
            List {
                Text("SU")
            }
        }
    }
}

#Preview {
    SettingsPage()
        .withRouter()
}
