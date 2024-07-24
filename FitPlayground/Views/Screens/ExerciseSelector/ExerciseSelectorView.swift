//
//  ExerciseSelectorView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import SwiftUI

struct ExerciseSelectorView: View {
    @ObservedObject var viewModel: ExerciseSelectorViewModel
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.appBg.ignoresSafeArea()
            
            VStack {
                SearchBar(text: $searchText)
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                    }
                    .padding(.vertical, 32)
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.appPrimary900, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBar(
            title: String.addExercises.capitalized,
            leftItem: .image(.backArrow, action: {})
        )
    }
}

#Preview {
    let coordinator = MainCoordinator(setRootView: {_ in })
    
    return ExerciseSelectorView(viewModel: .init(mainCoordinator: coordinator))
}
