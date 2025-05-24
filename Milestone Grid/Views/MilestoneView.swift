//
//  MilestoneView.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import SwiftUI
import XenopompEssentials

enum MilestonePosition {
    case last, first, none
}

protocol MilestoneTextProperties {
    var title: String? { get set }
    var desc: String? { get set }
    var longDesc: String? { get set }
}

protocol MilestoneProperties: MilestoneTextProperties {
    var pos: MilestonePosition? { get set }
}

struct MilestoneView: View, MilestoneProperties {
    // Text
    var title: String?
    var desc: String?
    var longDesc: String?
    
    // Colors
    var circleColor: Color = Color.red
    var guideColor: Color = Color.secondary
    
    // Bullet params
    let bulletSize: Int = 12
    var bulletGap: Double {
        return Double(bulletSize) / 5
    }
    
    var action: (() -> Void)?
    
    var pos: MilestonePosition? = MilestonePosition.none
    
    private func displayText(text: String?, fallback: String?) -> Text? {
        if text != nil {
            return Text("\(text!)")
        }
        else if fallback != nil {
            return Text(fallback!)
                .foregroundStyle(.secondary)
        }
        
        return nil
    }
    
    var body: some View {
        HStack {
            VStack {
                Rectangle()
                    .frame(width: 1)
                    .shrink(at: .height)
                    .foregroundStyle(
                        self.pos == .first
                            ? Color.init(red: 0, green: 0, blue: 0, opacity: 0)
                            : self.guideColor
                    )
                
                Circle()
                    .foregroundStyle(self.circleColor)
                    .frame(width: CGFloat(self.bulletSize), height: CGFloat(self.bulletSize))
                    .padding(.vertical, CGFloat(self.bulletGap))
                
                Rectangle()
                    .frame(width: 1)
                    .shrink(at: .height)
                    .foregroundStyle(
                        self.pos == .last
                            ? Color.init(red: 0, green: 0, blue: 0, opacity: 0)
                            : self.guideColor
                    )
            }
            .padding(0)
            .shrink(at: .height)
            .frame(alignment: .center)
            
            VStack {
                HorizontalAlign(alignment: .leading) {
                    self.displayText(text: title, fallback: "Unnamed")?.fontWeight(.bold)
                }
                
                HorizontalAlign(alignment: .leading) {
                    self.displayText(text: desc, fallback: nil)?.foregroundStyle(.secondary)
                }
            }
            .padding(.leading, 5)
            .padding(.horizontal, 0)
            .padding(.vertical, 10)
        }
        .shrink(at: .width)
        .padding(.horizontal, 10)
        .pressable {
            if let action = action {
                action()
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    let data = 0...10
    
    ScrollView {
        VStack(spacing: 0) {
            ForEach(
                data,
                id: \.self
            ) { idx in
                let displayingIdx = idx + 1
                let repeats = idx % 4
                let lastIdx = data.count - 1
                
                var pos: MilestonePosition {
                    if idx == 0 {
                        return .first
                    }
                    
                    if idx == lastIdx {
                        return .last
                    }
                    
                    return .none
                }
                
                MilestoneView(
                    title: "\(displayingIdx) - Item",
                    desc: String(repeating: "Hello\n", count: repeats),
                    pos: pos
                )
            }
        }
    }
}
