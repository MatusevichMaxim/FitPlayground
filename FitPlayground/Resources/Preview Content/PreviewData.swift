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
    
    // MARK: - Workouts
    static let workoutsPreset: [Workout] = [
        .init(name: "Core Engager 🎯", duration: 27, muscleGroups: [.abs, .back, .chest], status: .completed),
        .init(name: "Chair Rounds!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Leg Day", duration: 39, muscleGroups: [.legs], status: .active),
        .init(name: "Tabata Skip! 😎", duration: 24, muscleGroups: [.legs, .shoulders, .abs], status: .active),
        .init(name: "Morning Chair Rounds 💦", duration: 14, muscleGroups: [.back, .arms], status: .active),
        .init(name: "Lower Focus Flex!", duration: 30, muscleGroups: [.legs, .back, .abs], status: .active),
        .init(name: "Upper Focus Flex!", duration: 29, muscleGroups: [.arms, .shoulders], status: .active),
        .init(name: "Squat Posture Perfection 🏋🏼", duration: 39, muscleGroups: [.legs], status: .active)
    ]
}
#endif
