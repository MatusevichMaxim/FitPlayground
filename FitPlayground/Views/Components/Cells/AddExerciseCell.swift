//
//  AddExerciseCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/3/24.
//

import SwiftUI

struct AddExerciseCell: View {
    let action: () -> Void
    
    var body: some View {
        ActionButton(action: action) {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.appPrimary900)
                    .cornerRadius(StyleManager.cellRadius)
                
                HStack(spacing: 16) {
                    Image(systemName: "plus")
                        .font(.system(size: 16, weight: .black))
                        .foregroundStyle(Color.appPrimary800)
                        .frame(width: 54, height: 54)
                        .background(Color.appBg)
                        .cornerRadius(10)
                    
                    Text(String.addExerciseAction)
                        .font(.ms_extrabold_16)
                        .foregroundStyle(Color.textPrimary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 14)
                
            }
            .frame(height: StyleManager.cellHeight)
        }
    }
}

#Preview {
    AddExerciseCell(action: {})
        .previewLayout(.sizeThatFits)
        .padding()
}
