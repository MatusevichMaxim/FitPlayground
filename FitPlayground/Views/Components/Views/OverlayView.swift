//
//  OverlayView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

struct OverlayView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        Color.black
            .opacity(0.4)
            .ignoresSafeArea()
            .onTapGesture {
                guard isVisible else { return }
                
                isVisible.toggle()
            }
    }
}

#Preview {
    OverlayView(isVisible: .constant(true))
}
