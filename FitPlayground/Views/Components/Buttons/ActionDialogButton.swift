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
}

struct ActionDialogButton: View {
    let data: ActionDialogButtonModel
    
    var body: some View {
        ActionButton(action: {}) {
            HStack {
                Text(data.title)
                    .foregroundStyle(Color.textPrimary)
                    .font(.appTextHeader5)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: StyleManager.actionButtonHeight)
            .padding(.horizontal, 22)
            .background(data.background.color)
            .cornerRadius(StyleManager.cellRadius)
        }
    }
}

#Preview {
    ActionDialogButton(data: .init(
        title: "Button title",
        background: .default
    ))
    .previewLayout(.sizeThatFits)
    .padding()
}
