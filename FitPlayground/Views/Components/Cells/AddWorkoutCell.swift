//
//  AddWorkoutCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/17/24.
//

import SwiftUI

struct AddWorkoutCell: View {
    private let cornerRadius: CGFloat = 18
    
    @State private var isPressed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .clipShape(RoundedRectangle(cornerRadius: StyleManager.cellRadius, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: StyleManager.cellRadius)
                        .stroke(Color.appPrimary900, lineWidth: 4)
                )
            
            Image(systemName: "plus")
                .foregroundStyle(Color.appPrimary800)
                .font(.system(size: 16, weight: .black))
        }
        .frame(height: 82)
        .opacity(isPressed ? 0.6 : 1.0)
        .pressable()
    }
}

#Preview {
    AddWorkoutCell()
        .previewLayout(.sizeThatFits)
        .padding()
}
