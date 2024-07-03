//
//  Exercise.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/3/24.
//

import Foundation

struct Exercise: Identifiable {
    let id: UUID
    let name: String
    let muscleGroups: [MuscleGroup]
}
