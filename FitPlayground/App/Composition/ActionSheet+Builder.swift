//
//  ActionSheet+Builder.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/26/24.
//

import Foundation

protocol ActionSheetBuilder {
    func setElements() -> Self
    func build() -> [ActionSheetElement]
}

final class ActionSheetManager {
    func create(using builder: ActionSheetBuilder) -> [ActionSheetElement] {
        builder
            .setElements()
            .build()
    }
}

final class CreateNewActionSheetBuilder: ActionSheetBuilder {
    private var elements: [ActionSheetElement] = []
    
    func setElements() -> Self {
        elements = [
            .multilineButton(.init(title: .newWorkout, subtitle: .newWorkoutActionDesc, icon: .square_pencil_icon)),
            .multilineButton(.init(title: .instantActivity, subtitle: .instantActivityActionDesc, icon: .bolt_icon)),
            .multilineButton(.init(title: .existingWorkout, subtitle: .existingWorkoutActionDesc, icon: .folder_icon)),
            .separator,
            .cancelButton(.init(title: .cancel, showsDeleteOption: false))
        ]
        
        return self
    }
    
    func build() -> [ActionSheetElement] {
        elements
    }
}

final class ActivityOptionActionSheetBuilder: ActionSheetBuilder {
    private let isDone: Bool
    private var elements: [ActionSheetElement] = []
    
    init(isDone: Bool) {
        self.isDone = isDone
    }
    
    func setElements() -> Self {
        elements = [
            isDone 
            ? .defaultButton(.init(title: .markUndoneAction.capitalized, background: .default))
            : .defaultButton(.init(title: .markDoneAction.capitalized, background: .green)),
            .defaultButton(.init(title: .editWorkoutAction.capitalized, background: .default)),
            .separator,
            .cancelButton(.init(title: .cancel, showsDeleteOption: true))
        ]
        
        return self
    }
    
    func build() -> [ActionSheetElement] {
        elements
    }
}
