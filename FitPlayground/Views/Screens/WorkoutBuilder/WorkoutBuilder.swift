//
//  WorkoutBuilder.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/2/24.
//

import SwiftUI

struct WorkoutBuilder: View {
    @ObservedObject var viewModel: WorkoutBuilderViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBg.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        makeHeaderView()
                        
                        AddExerciseCell(action: {})
                    }
                    .padding(.vertical, 32)
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.appPrimary900, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(String.newWorkout.capitalized)
                            .font(.ms_semibold_16)
                            .foregroundColor(.textPrimary)
                    }
                }
            }
        }
    }
}

extension WorkoutBuilder {
    private func makeHeaderView() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("", text: $viewModel.name, prompt: makeNamePlaceholder())
                .font(.ms_extrabold_24)
                .foregroundStyle(Color.textPrimary)
            
            HStack(spacing: 0) {
                Text("\(viewModel.workout.duration) \(String.min.lowercased())")
                    .font(.cb_bold_18)
                    .foregroundStyle(Color.appGreen)
                
                Text("  ·  \(viewModel.workout.localizedDescription)")
                    .font(.cb_bold_18)
                    .foregroundStyle(Color.appPrimary800)
            }
        }
        .padding(.horizontal, 12)
    }
    
    private func makeNamePlaceholder() -> Text {
        Text("\(String.workoutNamePlaceholder.capitalized) ")
            .font(.ms_extrabold_24)
            .foregroundStyle(Color.appPrimary800)
    }
}

#Preview {
    WorkoutBuilder(viewModel: .init())
}
