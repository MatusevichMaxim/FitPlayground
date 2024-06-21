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
    }

    let title: String
    let background: ActionType
}

struct ActionDialogButton: View {
    let data: ActionDialogButtonModel
    
    var body: some View {
        ActionButton(action: {}) {
            ZStack {
                Text(data.title)
                    .foregroundStyle(Color.textPrimary)
                    .font(.appTextHeader5)
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            .frame(height: StyleManager.actionButtonHeight)
            .padding(.horizontal, 22)
            .background(Color.appPrimary800)
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
