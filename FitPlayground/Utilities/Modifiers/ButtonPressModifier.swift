//
//  ButtonPressModifier.swift
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
