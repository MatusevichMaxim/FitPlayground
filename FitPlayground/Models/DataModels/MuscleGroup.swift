//
//  MuscleGroup.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/13/24.
//

enum MuscleGroup {
    case abs
    case arms
    case back
    case chest
    case legs
    case shoulders
    
    var description: String {
        switch self {
        case .abs: return String.abs
        case .arms: return String.arms
        case .back: return String.back
        case .chest: return String.chest
        case .legs: return String.legs
        case .shoulders: return String.shoulders
        }
    }
}
