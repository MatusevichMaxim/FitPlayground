//
//  ActionDialogButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

struct ActionDialogButtonModel {
    enum ActionType {
        case `default`
        case green
        
        var color: Color {
            switch self {
            case .default: .appPrimary800
            case .green: .appGreen
            }
        }
    }

    let title: String
    let background: ActionType
    let action: () -> Void
    let alignment: ContentAlignment
    
    init(
        title: String,
        background: ActionType,
        action: @escaping () -> Void,
        alignment: ContentAlignment = .leading
    ) {
        self.title = title
        self.background = background
        self.action = action
        self.alignment = alignment
    }
}

struct ActionDialogButton: View {
    let model: ActionDialogButtonModel
    
    var body: some View {
        ActionButton(action: model.action) {
            Text(model.title)
                .foregroundStyle(Color.textPrimary)
                .font(.ms_bold_17)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: StyleManager.actionButtonHeight,
                    alignment: model.alignment.rawValue
                )
                .padding(.horizontal, 22)
                .background(model.background.color)
                .cornerRadius(StyleManager.cellRadius)
        }
    }
}

#Preview {
    ActionDialogButton(model: PreviewData.actionDialogButtonModel)
        .previewLayout(.sizeThatFits)
        .padding()
}
