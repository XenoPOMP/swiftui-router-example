//
//  ClickEvents.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import Foundation
import SwiftUI

struct OnClickViewModifier: ViewModifier {
    var callback: () -> Void
    
    init(_ callback: @escaping () -> Void) {
        self.callback = callback
    }
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                callback()
            }
    }
}

struct PressableViewModifier: ViewModifier {
    var action: (() -> Void)?
    
    func body(content: Content) -> some View {
        Button(action: action ?? {}, label: {
            content
        })
    }
}

extension View {
    func pressable(_ callback: @escaping () -> Void) -> some View {
        modifier(PressableViewModifier(action: callback))
    }
    
    func onTap(_ callback: @escaping () -> Void) -> some View {
        modifier(OnClickViewModifier(callback))
    }
}
