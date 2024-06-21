//
//  ActionSheetView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionSheetModel {
    let buttonModels: [MultilineButtonModel]
}

struct ActionSheetView: View {
    let data: ActionSheetModel
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(data.buttonModels, id: \.self) { model in
                ActionMultilineButton(data: .init(
                    title: model.title,
                    subtitle: model.subtitle,
                    icon: model.icon
                ))
            }
            
            Divider()
                .overlay(Color.appPrimary800)
            
            
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
        buttonModels: [
            .init(title: .newWorkout, subtitle: .newWorkoutActionDesc, icon: .square_pencil_icon),
            .init(title: .instantActivity, subtitle: .instantActivityActionDesc, icon: .bolt_icon),
            .init(title: .existingWorkout, subtitle: .existingWorkoutActionDesc, icon: .folder_icon)
        ]
    ))
        .previewLayout(.sizeThatFits)
}
