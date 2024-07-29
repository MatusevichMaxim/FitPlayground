//
//  ExercisesSetCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/3/24.
//

import SwiftUI

struct ExercisesSetCell: View {
    let exercises: [Exercise]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<exercises.count, id: \.self) { index in
                makeExerciseView(for: exercises[index])
                
                if index < exercises.count-1 {
                    Divider()
                        .background(Color.appPrimary800)
                        .padding(.horizontal, 10)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.appPrimary900)
        .cornerRadius(18)
    }
}

extension ExercisesSetCell {
    private enum DescType {
        case regular
        case bold
    }
    
    private func makeExerciseView(for model: Exercise) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "")
                .frame(width: 60, height: 60)
                .background(.white)
                .cornerRadius(18)
            
            VStack(alignment: .leading) {
                Text(model.name)
                    .font(.ms_extrabold_16)
                    .foregroundStyle(Color.textPrimary)
                    .lineLimit(2)
                
                makeDescText(for: "4", of: .bold)
                + makeDescText(for: " \(String.sets.lowercased()) · ", of: .regular)
                + makeDescText(for: "110", of: .bold)
                + makeDescText(for: " \(String.lbs.lowercased())", of: .regular)
            }
            .padding(.leading, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ActionButton(action: {}) {
                Image(systemName: "ellipsis")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.textTertiary)
                    .font(.system(size: 20))
                    .frame(minWidth: 50, maxHeight: .infinity)
                    .contentShape(Rectangle())
            }
        }
        .frame(height: 76)
    }
    
    private func makeDescText(for text: String, of type: DescType) -> Text {
        Text(text)
            .font(type == .regular ? .cb_medium_14 : .cb_bold_14)
            .foregroundStyle(type == .regular ? Color.textTertiary : Color.textPrimary)
    }
}

#Preview {
    ExercisesSetCell(exercises: PreviewData.supersetPreset)
        .previewLayout(.sizeThatFits)
        .padding()
}
