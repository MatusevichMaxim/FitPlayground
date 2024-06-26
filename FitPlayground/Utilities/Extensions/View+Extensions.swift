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
    func cornerRadius(_ radius: CGFloat) -> some View {
        return clipShape(.rect(cornerRadius: radius, style: .continuous))
    }
}
