//
//  OverlayView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

struct OverlayView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        Color.black
            .opacity(0.4)
            .ignoresSafeArea()
            .onTapGesture {
                guard isShowing else { return }
                
                isShowing.toggle()
            }
    }
}

#Preview {
    OverlayView(isShowing: .constant(true))
}
