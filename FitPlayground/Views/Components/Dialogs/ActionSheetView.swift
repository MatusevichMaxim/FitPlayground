//
//  ActionSheetView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

enum ActionSheetElement: Hashable {
    case defaultButton(ActionDialogButtonModel)
    case multilineButton(MultilineButtonModel)
    case cancelButton(ActionCancelModel)
    case separator
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .defaultButton(let model): hasher.combine(model)
        case .multilineButton(let model): hasher.combine(model)
        case .cancelButton(let model): hasher.combine(model)
        case .separator: hasher.combine("separator")
        }
    }
}

struct ActionSheetModel {
    let elements: [ActionSheetElement]
}

struct ActionSheetView: View {
    let data: ActionSheetModel
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(data.elements, id: \.self) { element in
                switch element {
                case .defaultButton(let model):
                    ActionDialogButton(data: model)
                    
                case .multilineButton(let model):
                    ActionMultilineButton(data: model)
                    
                case .cancelButton(let model):
                    ActionCancelButton(data: model)
                    
                case .separator:
                    Divider()
                        .overlay(Color.appPrimary800)
                }
            }
        }
        .padding(32)
        .background(Color.appPrimary900)
        .cornerRadius(StyleManager.dialogRadius)
        .frame(maxWidth: .infinity)
        .scaledToFit()
    }
}

#Preview {
    ActionSheetView(data: .init(
        elements: [
            .multilineButton(
                .init(title: .newWorkout, subtitle: .newWorkoutActionDesc, icon: .square_pencil_icon)
            ),
            .multilineButton(
                .init(title: .instantActivity, subtitle: .instantActivityActionDesc, icon: .bolt_icon)
            ),
            .multilineButton(
                .init(title: .existingWorkout, subtitle: .existingWorkoutActionDesc, icon: .folder_icon)
            ),
            .separator,
            .cancelButton(.init(title: .cancel, showsDeleteOption: false))
        ]
    ))
    .previewLayout(.sizeThatFits)
}
