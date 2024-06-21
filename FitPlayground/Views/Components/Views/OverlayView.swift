//
//  OverlayView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        Color.black
            .opacity(0.4)
            .ignoresSafeArea()
    }
}

#Preview {
    OverlayView()
}
