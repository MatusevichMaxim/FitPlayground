//
//  ActionSheetView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

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

struct ActionSheetModel {
    let elements: [ActionSheetElement]
}

struct ActionSheetView: View {
    @Binding var isShowing: Bool
    let data: ActionSheetModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                OverlayView()
                
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
                                .padding(.horizontal, 16)
                                .frame(height: 8)
                        }
                    }
                }
                .padding(32)
                .background(Color.appPrimary900)
                .cornerRadius(StyleManager.dialogRadius)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    ActionSheetView(isShowing: .constant(true), data: PreviewData.actionSheetCreateNew)
        .previewLayout(.sizeThatFits)
}
