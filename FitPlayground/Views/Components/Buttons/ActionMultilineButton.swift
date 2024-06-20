//
//  ActionMultilineButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct MultilineButtonModel: Hashable {
    let title: String
    let subtitle: String
    let icon: AppImageResourse
}

struct ActionMultilineButton: View {
    let data: MultilineButtonModel
    
    var body: some View {
        HStack() {
            Image(data.icon)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color.textSecondary)
                .font(.system(size: 20))
                .contentShape(Rectangle())
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(data.title)
                    .foregroundStyle(Color.textPrimary)
                    .font(.appTextHeader5)
                    .scaledToFit()
                
                Text(data.subtitle)
                    .foregroundStyle(Color.textTertiary)
                    .font(.appTextCaption1)
                    .scaledToFit()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: StyleManager.extendedActionButtonHeight)
        .padding(.horizontal, 11)
        .background(Color.appPrimary800)
        .cornerRadius(StyleManager.cellRadius)
        .pressable()
    }
}

#Preview {
    ActionMultilineButton(data: .init(
        title: "New workout",
        subtitle: "Create a new workout from scratch",
        icon: .square_pencil_icon
    ))
    .previewLayout(.sizeThatFits)
    .padding()
}
