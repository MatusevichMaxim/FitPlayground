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
        .init(name: "Chair Rounds1!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds2!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds3!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds4!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds5!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds6!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds7!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds8!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds9!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds10!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds11!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Chair Rounds12!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Leg Day", duration: 39, muscleGroups: [.legs], status: .active)
    ]
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            ScrollView {
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
                    .padding(.bottom, 64)
                }
                .background(Color.appPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(StyleManager.dialogRadius, for: [.topLeft, .topRight])
                .offset(y: headerHeight)
            }
        }
    }
}

// MARK: - Constants
fileprivate extension HomeTabView {
    var headerHeight: CGFloat { 160.0 }
}

#Preview {
    HomeTabView()
}
