//
//  AddWorkoutCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/17/24.
//

import SwiftUI

struct AddWorkoutCell: View {
    let action: () -> Void
    
    var body: some View {
        ActionButton(action: action) {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.appBg)
                    .cornerRadius(StyleManager.cellRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: StyleManager.cellRadius)
                            .stroke(Color.appPrimary900, lineWidth: 4)
                    )
                
                Image(systemName: "plus")
                    .foregroundStyle(Color.appPrimary800)
                    .font(.system(size: 16, weight: .black))
            }
            .frame(height: StyleManager.cellHeight)
        }
    }
}

#Preview {
    AddWorkoutCell(action: {})
        .previewLayout(.sizeThatFits)
        .padding()
}
