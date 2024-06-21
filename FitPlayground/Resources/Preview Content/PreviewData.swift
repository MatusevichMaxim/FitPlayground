//
//  PreviewData.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/21/24.
//

import SwiftUI

#if DEBUG
struct PreviewData {
    // MARK: - Dialogs
    static let actionSheetCreateNew = ActionSheetModel(elements: [
        .multilineButton(.init(title: .newWorkout, subtitle: .newWorkoutActionDesc, icon: .square_pencil_icon)),
        .multilineButton(.init(title: .instantActivity, subtitle: .instantActivityActionDesc, icon: .bolt_icon)),
        .multilineButton(.init(title: .existingWorkout, subtitle: .existingWorkoutActionDesc, icon: .folder_icon)),
        .separator,
        .cancelButton(.init(title: .cancel, showsDeleteOption: false))
    ])
    
    // MARK: - Buttons
    static let actionDialogButtonModel = ActionDialogButtonModel(title: .cancel, background: .default, alignment: .center)
    static let actionMultilineButtonModel = ActionMultilineButtonModel(title: .newWorkout, subtitle: .newWorkoutActionDesc, icon: .square_pencil_icon)
    static let actionCancelModel = ActionCancelModel(title: .cancel, showsDeleteOption: true)
    
    // MARK: - Cells
    static let workout = Workout(name: "Core Engager 🎯", duration: 55, muscleGroups: [.arms, .back, .shoulders], status: .active)
}
#endif
