//
//  MainView.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import SwiftUI
import XenopompEssentials

struct MilestoneData: MilestoneProperties, Hashable {
    var title: String?
    var desc: String?
    var longDesc: String?
    var pos: MilestonePosition?
    
}

struct MainView: View {
    let data: [MilestoneData] = [
        MilestoneData(title: "Last", pos: .first),
        MilestoneData(title: "Hello john", desc: "12:00", pos: .last)
    ]
    
    @Environment(Router.self) var router
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(
                    data,
                    id: \.self
                ) { item in
                    MilestoneView(
                        title: item.title,
                        desc: item.desc,
                        longDesc: item.longDesc,
                        action: {
                            self.router.navigate(.milestone(data: item))
                        },
                        pos: item.pos
                    )
                }
            }
        }
        .navigationTitle("Milestones")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    MainView()
        .withRouter()
}
