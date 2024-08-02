//
//  ExerciseSelectorView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import SwiftUI

struct ExerciseSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    @State private var selectedFiltersCount = 0
    @State private var isShowingFilters = false
    
    @ObservedObject var viewModel: ExerciseSelectorViewModel
    
    var body: some View {
        ZStack {
            Color.appBg.ignoresSafeArea()
            
            VStack {
                SearchBar(
                    text: $searchText,
                    filtersCount: $selectedFiltersCount,
                    onFiltersTap: { isShowingFilters.toggle() }
                )
                
                List {
                    Section(content: {
                        ForEach(viewModel.exercises) { exercise in
                            ExerciseCell(data: exercise, infoAction: { })
                                .listRowInsets(EdgeInsets())
                        }
                    }, header: {
                        Text(String.allExercises.capitalized)
                            .font(.ms_bold_16)
                            .foregroundStyle(Color.appPrimary800)
                            .padding(.init(top: 16, leading: 16, bottom: 10, trailing: 16))
                            .listRowInsets(EdgeInsets())
                    })
                    .headerProminence(.increased)
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
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
        .onReceive(viewModel.filtersProvider.selectedFilters) { selectedFiltersCount = $0 }
        .sheet(isPresented: $isShowingFilters) {
            FiltersSelectorView(viewModel: viewModel.configureFiltersSelectorViewModel())
        }
    }
}

#Preview {
    let coordinator = WorkoutBuilderCoordinator(isWorkoutBuilderFlowPresented: .init(true))
    let filtersManager = FiltersManager()
    
    return ExerciseSelectorView(viewModel: .init(
        coordinator: coordinator,
        filtersManager: filtersManager,
        filtersProvider: filtersManager
    ))
}
