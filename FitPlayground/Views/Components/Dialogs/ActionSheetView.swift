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
                OverlayView(isShowing: $viewModel.isVisible)
                    .zIndex(1)
                
                VStack(spacing: 10) {
                    ForEach(viewModel.elements, id: \.self) { element in
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
                .zIndex(2)
            }
        }
        .frame(alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: viewModel.isVisible)
    }
}

#Preview {
    ActionSheetView(viewModel: ActionSheetViewModel(elements: PreviewData.actionSheetCreateNew))
}
