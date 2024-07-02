//
//  DayPlanCell.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/1/24.
//

import SwiftUI

struct DayPlanCell: View {
    let date: Date
    let workouts: [Workout]
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            VStack {
                Text(date.dayOfWeek)
                    .font(.appTextHeader6)
                    .foregroundStyle(dayTextColor)
                
                Text(date.formattedDate)
                    .font(.appTextCaption3)
                    .foregroundStyle(dateTextColor)
            }
            .padding(.top, 12)
            .frame(width: 40)
            
            LazyVStack(spacing: StyleManager.cellSpacing) {
                ForEach(workouts) { workout in
                    WorkoutCell(data: workout, optionAction: {})
                }
                
                AddWorkoutCell(action: {})
            }
        }
    }
}

extension DayPlanCell {
    var dayTextColor: Color {
        // TODO: formattedDate - temporary solution
        date == Date().erasedTime ? .textPrimary : .textTertiary
    }
    
    var dateTextColor: Color {
        // TODO: formattedDate - temporary solution
        date == Date().erasedTime ? .textSecondary : .appSecondary600
    }
}

#Preview {
    DayPlanCell(date: .now, workouts: PreviewData.workoutsPlanPreset)
        .previewLayout(.sizeThatFits)
        .padding()
}
