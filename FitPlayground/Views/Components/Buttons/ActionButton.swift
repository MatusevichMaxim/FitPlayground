//
//  ActionButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionButtonModel {
    enum ActionType {
        case `default`
        case green
    }
    
    let title: String
    let background: ActionType
}

struct ActionButton: View {
    let data: ActionButtonModel
    
    var body: some View {
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

#Preview {
    ActionButton(data: .init(title: "Button title", background: .default))
        .previewLayout(.sizeThatFits)
        .padding()
}
