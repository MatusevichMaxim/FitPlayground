//
//  Workout.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/13/24.
//

struct Workout: Hashable {
    let name: String
    let duration: Int
    let muscleGroups: [MuscleGroup]
    
    var muscleGroupsString: String {
        muscleGroups
            .map { $0.description }
            .joined(separator: ", ")
    }
}
