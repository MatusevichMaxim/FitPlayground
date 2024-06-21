//
//  ActionCancelButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionCancelModel: Hashable {
    let title: String
    let showsDeleteOption: Bool
}

struct ActionCancelButton: View {
    let data: ActionCancelModel
    
    var body: some View {
        HStack(spacing: 16) {
            if data.showsDeleteOption {
                ActionButton(action: {}) {
                    ZStack {
                        Image(.bin_icon)
                            .foregroundStyle(Color.appRed)
                    }
                    .frame(maxWidth: Constants.deleteButtonWidth, maxHeight: StyleManager.actionButtonHeight)
                    .cornerRadius(StyleManager.cellRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: StyleManager.cellRadius)
                            .stroke(Color.appRed200, lineWidth: 4)
                    )
                }
            }
            
            ActionDialogButton(data: .init(title: data.title, background: .default, alignment: .center))
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
    ActionCancelButton(data: PreviewData.actionCancelModel)
        .previewLayout(.sizeThatFits)
        .padding()
}
