//
//  ExerciseSelectorView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import SwiftUI

struct ExerciseSelectorView: View {
    @Environment(\.dismiss) var dismiss
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
        .navigationBarBackButtonHidden(true)
        .navigationBar(
            title: String.addExercises.capitalized,
            leftItem: .image(.backArrow, action: { dismiss() })
        )
    }
}

#Preview {
    let coordinator = WorkoutBuilderCoordinator(isWorkoutBuilderFlowPresented: .init(true))
    
    return ExerciseSelectorView(viewModel: .init(coordinator: coordinator))
}
