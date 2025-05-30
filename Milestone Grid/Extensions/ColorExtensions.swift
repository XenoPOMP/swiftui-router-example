//
//  ColorExtensions.swift
//  Milestone Grid
//
//  Created by Александр on 24.05.2025.
//

import Foundation
import SwiftUI
import UIKit

extension UIColor {
    func toColor() -> Color {
        return Color(self)
    }
}

extension Color {
    public static let transparent: Color = Color.init(red: 0, green: 0, blue: 0, opacity: 0)
}
