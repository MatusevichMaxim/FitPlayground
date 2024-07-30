//
//  ExerciseFilter.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

protocol FilterType {}

enum MuscleGroupFilter: CaseIterable, FilterType {
    case any,
         abs,
         arms,
         back,
         chest,
         legs,
         shoulders
    
    var subfilters: [GroupSubfilter?] {
        switch self {
        case .abs: return [.obliques]
        case .arms: return [.biceps, .forearms, .triceps]
        case .back: return [.lats, .lowerBack, .middleBack, .traps, .upperBack]
        case .legs: return [.abductors, .adductors, .calves, .glutes, .hamstrings, .hipFlexors, .quads]
        default: return []
        }
    }
    
    var localizedName: String {
        switch self {
        case .any: return String.anyMuscle.capitalized
        case .abs: return String.abs
        case .arms: return String.arms
        case .back: return String.back
        case .chest: return String.chest
        case .legs: return String.legs
        case .shoulders: return String.shoulders
        }
    }
}

enum GroupSubfilter {
    case obliques,
    
         biceps,
         forearms,
         triceps,
    
         lats,
         lowerBack,
         middleBack,
         traps,
         upperBack,
    
         abductors,
         adductors,
         calves,
         glutes,
         hamstrings,
         hipFlexors,
         quads
}

enum EquipmentFilter: CaseIterable, FilterType {
    case any,
         no,
         barbell,
         dumbbell,
         machines,
         resistanceBand,
         kettlebell,
         cardio,
         other
    
    var localizedName: String {
        switch self {
        case .any: return String.anyEquipment
        case .no: return String.noEqupment
        case .barbell: return String.barbell
        case .dumbbell: return String.dumbbell
        case .machines: return String.machines
        case .resistanceBand: return String.resistanceBand
        case .kettlebell: return String.kettlebell
        case .cardio: return String.cardio
        case .other: return String.other
        }
    }
}
