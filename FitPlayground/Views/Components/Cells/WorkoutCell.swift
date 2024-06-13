//
//  WorkoutCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/13/24.
//

import SwiftUI

struct WorkoutCell: View {
    private var workoutDescription: String {
        "\(data.duration) \(String.min.lowercased()) · \(data.muscleGroupsString)"
    }
    
    let data: Workout
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 8) {
                Text(data.name)
                    .foregroundStyle(Color(.textPrimary))
                    .font(.appTextHeader2)
                Text(workoutDescription)
                    .foregroundStyle(Color(.textSecondary))
                    .font(.appTextCaption1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color(.textSecondary))
                .font(.system(size: 20))
                .contentShape(Rectangle())
                .frame(minWidth: 50)
        }
        .padding(.init(top: 20, leading: 24, bottom: 20, trailing: 8))
        .background(Color(.appGreen))
        .clipShape(.rect(cornerRadius: 18, style: .continuous))
    }
}

#Preview {
    WorkoutCell(data: .init(name: "Core Engager 🎯",
                duration: 55,
                muscleGroups: [.arms, .back, .shoulders])
    )
    .previewLayout(.sizeThatFits)
    .padding()
}
