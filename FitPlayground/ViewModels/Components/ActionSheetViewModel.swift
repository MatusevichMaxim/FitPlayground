//
//  ActionSheetViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/25/24.
//

import Foundation

enum ActionSheetElement {
    case defaultButton(ActionDialogButtonModel)
    case multilineButton(ActionMultilineButtonModel)
    case cancelButton(ActionCancelModel)
    case separator
}

final class ActionSheetViewModel: ObservableObject {
    @Published var isVisible: Bool = false
    var elements: [ActionSheetElement] = []
}
