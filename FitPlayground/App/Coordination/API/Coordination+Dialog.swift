//
//  Coordination+Dialog.swift
//  Specific file name because of issue
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/24/24.
//

enum DialogType {
    case createNew
    case activityOption(isDone: Bool)
}

protocol DialogCoordination {
    func showDialog(type: DialogType)
    func hideDialog(animated: Bool)
}
