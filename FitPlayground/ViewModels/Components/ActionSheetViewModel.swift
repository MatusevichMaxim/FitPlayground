//
//  ActionSheetViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/25/24.
//

import Foundation

enum ActionSheetElement: Hashable {
    case defaultButton(ActionDialogButtonModel)
    case multilineButton(ActionMultilineButtonModel)
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

final class ActionSheetViewModel: ObservableObject {
    @Published var isVisible: Bool = false
    var elements: [ActionSheetElement] = []
}
