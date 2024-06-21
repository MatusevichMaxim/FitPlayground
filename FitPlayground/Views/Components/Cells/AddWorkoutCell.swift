//
//  AddWorkoutCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/17/24.
//

import SwiftUI

struct AddWorkoutCell: View {
    var body: some View {
        ActionButton(action: {}) {
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
            .frame(height: 82)
        }
    }
}

#Preview {
    AddWorkoutCell()
        .previewLayout(.sizeThatFits)
        .padding()
}
