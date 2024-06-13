//
//  HomeTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct HomeTabView: View {
    private let workoutsInfo: [Workout] = [
        .init(name: "Core Engager 🎯", duration: 27, muscleGroups: [.abs, .back, .chest]),
        .init(name: "Chair Rounds!", duration: 11, muscleGroups: [.legs, .back]),
        .init(name: "Leg Day", duration: 39, muscleGroups: [.legs])
    ]
    
    var body: some View {
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 18) {
                    Text("\(.today)")
                        .font(.appTextHeader1)
                        .foregroundStyle(Color(.textPrimary))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(workoutsInfo, id: \.self) { info in
                        WorkoutCell(data: info)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    HomeTabView()
}
