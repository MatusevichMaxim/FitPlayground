//
//  ScrollOffsetPreferenceKey.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/19/24.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
