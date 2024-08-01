//
//  ExerciseFilter.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import Foundation

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
    
    var icon: AppImageResourse {
        switch self {
        case .any: return .human_filter_icon
        case .abs: return .abs_filter_icon
        case .arms: return .arm_filter_icon
        case .back: return .back_filter_icon
        case .chest: return .chest_filter_icon
        case .legs: return .leg_filter_icon
        case .shoulders: return .shoulder_filter_icon
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
    
    var icon: AppImageResourse {
        switch self {
        case .any: return .equipment_filter_icon
        case .no: return .no_filter_equipment_icon
        case .barbell: return .barbell_filter_icon
        case .dumbbell: return .dumbbell_filter_icon
        case .machines: return .machine_filter_icon
        case .resistanceBand: return .band_filter_icon
        case .kettlebell: return .kettlebell_filter_icon
        case .cardio: return .cardio_filter_icon
        case .other: return .other_filter_icon
        }
    }
}
