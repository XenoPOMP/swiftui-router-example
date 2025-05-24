//
//  MilestonePage.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import SwiftUI
import XenopompEssentials

struct MilestonePage: View {
    var item: MilestoneData
    
    var body: some View {
        Page(
            title: item.title ?? "Unnamed",
            titleDisplayMode: .large
        ) {
            VStack(alignment: .leading) {
                Text(item.desc ?? "No description provided")
                    .italic()
                    .foregroundStyle(.secondary)
                
                if let longDesc = item.longDesc {
                    Text(longDesc)
                        .padding(.top)
                        .font(.system(size: 18))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MilestonePage(
            item: MilestoneData(
                title: "Sample milestone page",
                desc: "12:00",
                longDesc:
                    """
                    Hello world!
                    This is my first milestone.
                    """
            )
        )
    }
}
