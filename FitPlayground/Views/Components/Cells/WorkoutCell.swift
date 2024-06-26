//
//  WorkoutCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/13/24.
//

import SwiftUI

struct WorkoutCell: View {
    let data: Workout
    let optionAction: () -> Void
    
    var body: some View {
        ActionButton(action: {}) {
            HStack() {
                VStack(alignment: .leading, spacing: 12) {
                    Text(data.name)
                        .foregroundStyle(Color.textPrimary)
                        .font(.appTextHeader3)
                        .frame(height: 18)
                    
                    Text(data.localizedDescription)
                        .foregroundStyle(Color.textSecondary)
                        .font(.appTextCaption1)
                        .frame(height: 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "ellipsis")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.textSecondary)
                    .font(.system(size: 20))
                    .contentShape(Rectangle())
                    .frame(minWidth: 50, maxHeight: .infinity)
            }
            .padding(.init(top: 20, leading: 24, bottom: 20, trailing: 8))
            .background(data.status.backgroundColor)
            .cornerRadius(StyleManager.cellRadius)
        }
        .frame(height: StyleManager.cellHeight)
    }
}

#Preview {
    WorkoutCell(data: PreviewData.workout, optionAction: {})
        .previewLayout(.sizeThatFits)
        .padding()
}
