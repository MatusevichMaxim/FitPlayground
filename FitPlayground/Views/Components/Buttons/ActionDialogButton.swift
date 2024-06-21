//
//  ActionDialogButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

struct ActionDialogButtonModel: Hashable {
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
    let alignment: ContentAlignment
    
    init(title: String, background: ActionType, alignment: ContentAlignment = .leading) {
        self.title = title
        self.background = background
        self.alignment = alignment
    }
}

struct ActionDialogButton: View {
    let data: ActionDialogButtonModel
    
    var body: some View {
        ActionButton(action: {}) {
            Text(data.title)
                .foregroundStyle(Color.textPrimary)
                .font(.appTextHeader5)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: StyleManager.actionButtonHeight,
                    alignment: data.alignment.rawValue
                )
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
