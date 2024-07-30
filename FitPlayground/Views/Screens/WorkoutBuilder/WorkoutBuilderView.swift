//
//  WorkoutBuilderView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/2/24.
//

import SwiftUI

struct WorkoutBuilderView: View {
    @ObservedObject var viewModel: WorkoutBuilderViewModel
    @ObservedObject var router = NavigationRouter<WorkoutFlowDestination>()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                Color.appBg.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        makeHeaderView()
                        
                        ExercisesSetCell(exercises: [.init(id: UUID(), name: "Step-Up", muscleGroups: [.chest])])
                        ExercisesSetCell(exercises: PreviewData.supersetPreset)
                        
                        AddExerciseCell(action: viewModel.onAddExerciseTapped)
                    }
                    .padding(.vertical, 32)
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.appPrimary900, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBar(
                title: String.newWorkout.capitalized,
                leftItem: .image(.xmark, action: viewModel.onCloseTapped),
                rightItem: .text(text: String.save, color: .appGreen, action: {})
            )
            .navigationDestination(for: WorkoutFlowDestination.self) { destination in
                switch destination {
                case .exerciseSelector:
                    ExerciseSelectorView(viewModel: viewModel.exerciseSelectorViewModel)
                }
            }
            .handleNavigationActions(viewModel.routingAction.eraseToAnyPublisher(), router: router)
        }
    }
}

extension WorkoutBuilderView {
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
    let coordinator = WorkoutBuilderCoordinator(isWorkoutBuilderFlowPresented: ValueSubject(false))
    let filtersManager = FiltersManager()
    
    return WorkoutBuilderView(viewModel: .init(
        coordinator: coordinator,
        exerciseSelectorViewModel: .init(coordinator: coordinator, filtersProvider: filtersManager)
    ))
}
