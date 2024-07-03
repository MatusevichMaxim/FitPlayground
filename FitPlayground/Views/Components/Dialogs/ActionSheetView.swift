//
//  ActionSheetView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionSheetView: View {
    @ObservedObject var viewModel: ActionSheetViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if viewModel.isVisible {
                OverlayView(isVisible: $viewModel.isVisible)
                    .zIndex(1)
                
                VStack(spacing: 10) {
                    ForEach(0..<viewModel.elements.count, id: \.self) { index in
                        switch viewModel.elements[index] {
                        case .defaultButton(let model):
                            ActionDialogButton(model: model)
                            
                        case .multilineButton(let model):
                            ActionMultilineButton(model: model)
                            
                        case .cancelButton(let model):
                            ActionCancelButton(model: model)
                            
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
                .zIndex(2)
            }
        }
        .frame(alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeOut(duration: StyleManager.dialogAnimationDuration), value: viewModel.isVisible)
    }
}

#Preview {
    var viewModel = ActionSheetViewModel()
    viewModel.elements = PreviewData.actionSheetCreateNew
    viewModel.isVisible = true
    return ActionSheetView(viewModel: viewModel)
}
