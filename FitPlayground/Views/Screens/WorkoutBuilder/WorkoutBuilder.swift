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
                    VStack {
                        VStack {
                            TextField(String.workoutDefaultName, text: $viewModel.name)
                                .font(.ms_extrabold_24)
                            
                            HStack {
                                Text("11 min")
                                
                                Text(" · Chest, Lower Back, Shoulders")
                            }
                        }
                    }
                    .padding(.vertical, 20)
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

#Preview {
    WorkoutBuilder(viewModel: .init())
}
