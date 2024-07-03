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

class ActionSheet {
    init(mainCoordinator: MainCoordination, dialogCoordinator: DialogCoordination) {
        self.mainCoordinator = mainCoordinator
        self.dialogCoordinator = dialogCoordinator
    }
    
    let mainCoordinator: MainCoordination
    let dialogCoordinator: DialogCoordination
}

final class CreateNewActionSheetBuilder: ActionSheet, ActionSheetBuilder {
    private var elements: [ActionSheetElement] = []
    
    func setElements() -> Self {
        elements = [
            .multilineButton(.init(
                title: .newWorkout,
                subtitle: .newWorkoutActionDesc,
                icon: .square_pencil_icon,
                action: mainCoordinator.openWorkoutBuilder
            )),
            .multilineButton(
                .init(title: .instantActivity, subtitle: .instantActivityActionDesc, icon: .bolt_icon, action: {})
            ),
            .multilineButton(
                .init(title: .existingWorkout, subtitle: .existingWorkoutActionDesc, icon: .folder_icon, action: {})
            ),
            .separator,
            .cancelButton(.init(
                title: .cancel,
                showsDeleteOption: false,
                action: dialogCoordinator.hideDialog,
                deleteAction: {}
            ))
        ]
        
        return self
    }
    
    func build() -> [ActionSheetElement] {
        elements
    }
}

final class ActivityOptionActionSheetBuilder: ActionSheet, ActionSheetBuilder {
    private let isDone: Bool
    private var elements: [ActionSheetElement] = []
    
    init(
        mainCoordinator: MainCoordination,
        dialogCoordinator: DialogCoordination,
        isDone: Bool
    ) {
        self.isDone = isDone
        
        super.init(mainCoordinator: mainCoordinator, dialogCoordinator: dialogCoordinator)
    }
    
    func setElements() -> Self {
        elements = [
            isDone 
            ? .defaultButton(.init(title: .markUndoneAction.capitalized, background: .default, action: {}))
            : .defaultButton(.init(title: .markDoneAction.capitalized, background: .green, action: {})),
            .defaultButton(.init(title: .editWorkoutAction.capitalized, background: .default, action: {})),
            .separator,
            .cancelButton(.init(title: .cancel, showsDeleteOption: true, action: {}))
        ]
        
        return self
    }
    
    func build() -> [ActionSheetElement] {
        elements
    }
}
