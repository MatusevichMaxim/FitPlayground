//
//  ExerciseCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/28/24.
//

import SwiftUI

struct ExerciseCell: View {
    let data: Exercise
    let infoAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.appBg)
            
            HStack(spacing: 16) {
                Image(uiImage: .init())
                    .font(.system(size: 16, weight: .black))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(1, contentMode: .fill)
                    .background(Color.white)
                    .fixedSize(horizontal: true, vertical: false)
                    .cornerRadius(18)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(data.name)
                        .font(.ms_extrabold_16)
                        .foregroundStyle(Color.textPrimary)
                    
                    Text(data.localizedDescription)
                        .font(.cb_bold_14)
                        .foregroundStyle(Color.textSecondary)
                }
                
                Spacer()
                
                ActionButton(action: infoAction) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundStyle(Color.textPrimary)
                }
                .frame(width: 40, height: 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.init(top: 6, leading: 20, bottom: 6, trailing: 16))
        }
        .frame(height: 72)
        .onTapGesture {
        }
    }
}

#Preview {
    ExerciseCell(
        data: .init(id: .init(), name: "Cable Hip Adduction", muscleGroups: [.abs, .arms]),
        infoAction: {}
    )
}
