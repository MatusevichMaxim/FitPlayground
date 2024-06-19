//
//  HomeTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct HomeTabView: View {
    private let workoutsInfo: [Workout] = [
        .init(name: "Core Engager 🎯", duration: 27, muscleGroups: [.abs, .back, .chest], status: .completed),
        .init(name: "Chair Rounds!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Leg Day", duration: 39, muscleGroups: [.legs], status: .active)
    ]
    
    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            
            VStack {
                AnimatedGradientView()
                    .frame(height: Constants.headerHeight * 2)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: Constants.headerHeight)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        Text("\(.today)")
                            .font(.appTextHeader1)
                            .foregroundStyle(Color.textPrimary)
                            .padding(.top, 24)
                            .padding(.horizontal, 32)
                        
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(workoutsInfo, id: \.self) { info in
                                WorkoutCell(data: info)
                            }
                            
                            AddWorkoutCell()
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 32)
                    }
                    .background(Color.appPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .cornerRadius(StyleManager.dialogRadius, for: [.topLeft, .topRight])
                }
            }
            .scrollIndicators(.hidden)
            .shadow(color: .appPrimary, radius: 10, y: 5)
        }
    }
}

extension HomeTabView {
    private enum Constants {
        static let headerHeight: CGFloat = 160.0
    }
}

#Preview {
    HomeTabView()
}
