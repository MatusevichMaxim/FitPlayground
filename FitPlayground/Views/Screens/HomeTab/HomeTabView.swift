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
        NavigationStack {
            ZStack {
                Color.appPrimary.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        Text("\(.today)")
                            .font(.appTextHeader1)
                            .foregroundStyle(Color.textPrimary)
                            .padding(.horizontal, 16)
                        
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(workoutsInfo, id: \.self) { info in
                                WorkoutCell(data: info)
                            }
                            
                            AddWorkoutCell()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        AsyncImage(
                            url: URL(string: "https://picsum.photos/200"),
                            content: { image in image.image?.resizable() }
                        )
                        .frame(width: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        
                        VStack(alignment: .leading) {
                            Text("\(.greetingsMorning),")
                                .font(.appTextCaption2)
                                .foregroundStyle(Color.textSecondary)
                            Text("Maksim")
                                .font(.appTextHeader3)
                                .foregroundStyle(Color.textPrimary)
                        }
                    }
                    .frame(height: 44)
                }
            }
        }
    }
}

#Preview {
    HomeTabView()
}
