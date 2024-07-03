//
//  ActionMultilineButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionMultilineButtonModel {
    let title: String
    let subtitle: String
    let icon: AppImageResourse
    let action: () -> Void
}

struct ActionMultilineButton: View {
    let model: ActionMultilineButtonModel
    
    var body: some View {
        ActionButton(action: model.action) {
            HStack() {
                Image(model.icon)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.textSecondary)
                    .font(.system(size: 20))
                    .contentShape(Rectangle())
                    .frame(width: 40, height: 40)
            
                VStack(alignment: .leading, spacing: 2) {
                    Text(model.title)
                        .foregroundStyle(Color.textPrimary)
                        .font(.ms_bold_17)
                        .scaledToFit()
            
                    Text(model.subtitle)
                        .foregroundStyle(Color.textTertiary)
                        .font(.cb_medium_14)
                        .scaledToFit()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: StyleManager.extendedActionButtonHeight)
            .padding(.horizontal, 11)
            .background(Color.appPrimary800)
            .cornerRadius(StyleManager.cellRadius)
        }
    }
}

#Preview {
    ActionMultilineButton(model: PreviewData.actionMultilineButtonModel)
        .previewLayout(.sizeThatFits)
        .padding()
}
