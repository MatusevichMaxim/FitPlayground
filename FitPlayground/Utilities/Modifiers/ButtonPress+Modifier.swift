//
//  ButtonPress+Modifier.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import Foundation
import SwiftUI

struct ButtonPressModifier: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in onPress() }
                    .onEnded { _ in onRelease() }
            )
    }
}

struct PressableModifier: ViewModifier {
    @State private var isPressed = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isPressed ? 0.7 : 1.0)
            .pressEvents(
                onPress: { isPressed = true },
                onRelease: { isPressed = false }
            )
    }
}
