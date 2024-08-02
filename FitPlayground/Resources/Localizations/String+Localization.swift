//
//  String+Localization.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import Foundation

extension String {
    // MARK: - Common
    public static let potential = localizedString(for: "potential")
    public static let today = localizedString(for: "today")
    public static let cancel = localizedString(for: "cancel")
    public static let min = localizedString(for: "minutes_short")
    public static let set = localizedString(for: "set_singular")
    public static let sets = localizedString(for: "set_plural")
    public static let lbs = localizedString(for: "lbs")
    public static let save = localizedString(for: "save")
    public static let other = localizedString(for: "other")
    public static let muscleGroup = localizedString(for: "muscle_group")
    public static let equipment = localizedString(for: "equipment")
    
    public static let newWorkout = localizedString(for: "new_workout")
    public static let existingWorkout = localizedString(for: "existing_workout")
    public static let instantActivity = localizedString(for: "instant_activity")
    public static let addExercises = localizedString(for: "add_exercises")
    public static let allExercises = localizedString(for: "all_exercises")
    public static let searchByName = localizedString(for: "search_by_name")
    
    // MARK: - Tabs
    public static let homeTabTitle = localizedString(for: "home_tab_title")
    public static let calendarTabTitle = localizedString(for: "calendar_tab_title")
    public static let workoutsTabTitle = localizedString(for: "workouts_tab_title")
    
    // MARK: - Muscle Groups
    public static let anyMuscle = localizedString(for: "mg_any")
    public static let abs = localizedString(for: "mg_abs")
    public static let arms = localizedString(for: "mg_arms")
    public static let back = localizedString(for: "mg_back")
    public static let chest = localizedString(for: "mg_chest")
    public static let legs = localizedString(for: "mg_legs")
    public static let shoulders = localizedString(for: "mg_shoulders")
    public static let obliques = localizedString(for: "mg_obliques")
    public static let biceps = localizedString(for: "mg_biceps")
    public static let forearms = localizedString(for: "mg_forearms")
    public static let triceps = localizedString(for: "mg_triceps")
    public static let lats = localizedString(for: "mg_lats")
    public static let lowerBack = localizedString(for: "mg_lower_back")
    public static let middleBack = localizedString(for: "mg_middle_back")
    public static let traps = localizedString(for: "mg_traps")
    public static let upperBack = localizedString(for: "mg_upper_back")
    public static let abductors = localizedString(for: "mg_abductors")
    public static let adductors = localizedString(for: "mg_adductors")
    public static let calves = localizedString(for: "mg_calves")
    public static let glutes = localizedString(for: "mg_glutes")
    public static let hamstrings = localizedString(for: "mg_hamstrings")
    public static let hipFlexors = localizedString(for: "mg_hip_flexors")
    public static let quads = localizedString(for: "mg_quads")
    
    // MARK: - Equipment
    public static let anyEquipment = localizedString(for: "eq_any")
    public static let noEqupment = localizedString(for: "eq_no")
    public static let barbell = localizedString(for: "eq_barbell")
    public static let dumbbell = localizedString(for: "eq_dumbbell")
    public static let machines = localizedString(for: "eq_machines")
    public static let resistanceBand = localizedString(for: "eq_resist_band")
    public static let kettlebell = localizedString(for: "eq_kettlebell")
    public static let cardio = localizedString(for: "eq_cardio")
    
    // MARK: - Greetings
    public static let greetingsMorning = localizedString(for: "greetings_morning")
    
    // MARK: - Slogans
    public static let firstSloganTitle = localizedString(for: "slogan_1_ln1")
    public static let firstSloganSubtitle = localizedString(for: "slogan_1_ln2")
    
    // MARK: - Actions
    public static let newWorkoutActionDesc = localizedString(for: "btn_desc_new_workout")
    public static let instantActivityActionDesc = localizedString(for: "btn_desc_instant_activity")
    public static let existingWorkoutActionDesc = localizedString(for: "btn_desc_existing_workout")
    public static let markDoneAction = localizedString(for: "btn_mark_done")
    public static let markUndoneAction = localizedString(for: "btn_mark_undone")
    public static let editWorkoutAction = localizedString(for: "btn_edit_workout")
    public static let addExerciseAction = localizedString(for: "btn_add_exercise")
    
    // MARK: Workouts
    public static let workoutNamePlaceholder = localizedString(for: "workout_name_placeholder")
    public static let workoutDefaultName = localizedString(for: "workout_default_name")
    
    private static func localizedString(for key: String) -> String {
        NSLocalizedString(String(describing: key), comment: "")
    }
}
