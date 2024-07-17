//
//  DialogCoordination.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/25/24.
//

enum DialogType {
    case createNew
    case activityOption(isDone: Bool)
}

protocol DialogCoordination {
    func showDialog(type: DialogType)
    func hideDialog(animated: Bool)
}
