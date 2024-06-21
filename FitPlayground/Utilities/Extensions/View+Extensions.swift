//
//  View+Extensions.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/18/24.
//

import SwiftUI
import UIKit

// MARK: - Appearance
extension View {
    func cornerRadius(_ radius: CGFloat, for corners: [UIRectCorner]) -> some View {
        let rect = UnevenRoundedRectangle(
            topLeadingRadius: corners.contains(where: { $0 == .topLeft }) ? radius : 0,
            bottomLeadingRadius: corners.contains(where: { $0 == .bottomLeft }) ? radius : 0,
            bottomTrailingRadius: corners.contains(where: { $0 == .bottomRight }) ? radius : 0,
            topTrailingRadius: corners.contains(where: { $0 == .topRight }) ? radius : 0,
            style: .continuous
        )
        return clipShape(rect)
    }
    
    func cornerRadius(_ radius: CGFloat) -> some View {
        return clipShape(.rect(cornerRadius: radius, style: .continuous))
    }
}
