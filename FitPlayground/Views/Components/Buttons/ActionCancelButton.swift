//
//  ActionCancelButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionCancelModel {
    let title: String
    let showsDeleteOption: Bool
    let action: () -> Void
    let deleteAction: () -> Void
    
    init(
        title: String,
        showsDeleteOption: Bool,
        action: @escaping () -> Void,
        deleteAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.showsDeleteOption = showsDeleteOption
        self.action = action
        self.deleteAction = deleteAction
    }
}

struct ActionCancelButton: View {
    let model: ActionCancelModel
    
    var body: some View {
        HStack(spacing: 16) {
            if model.showsDeleteOption {
                ActionButton(action: model.deleteAction) {
                    ZStack {
                        Image(.bin_icon)
                            .foregroundStyle(Color.appRed)
                    }
                    .frame(maxWidth: Constants.deleteButtonWidth, maxHeight: StyleManager.actionButtonHeight)
                    .cornerRadius(StyleManager.cellRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: StyleManager.cellRadius)
                            .stroke(Color.appRed200, lineWidth: 3)
                            .padding(1.5)
                    )
                }
            }
            
            ActionDialogButton(model: .init(
                title: model.title,
                background: .default,
                action: model.action,
                alignment: .center
            ))
        }
        .frame(height: StyleManager.actionButtonHeight)
    }
}

extension ActionCancelButton {
    private enum Constants {
        static let deleteButtonWidth: CGFloat = 100.0
    }
}

#Preview {
    ActionCancelButton(model: PreviewData.actionCancelModel)
        .previewLayout(.sizeThatFits)
        .padding()
}
