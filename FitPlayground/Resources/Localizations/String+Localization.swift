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
    
    public static let newWorkout = localizedString(for: "new_workout")
    public static let existingWorkout = localizedString(for: "existing_workout")
    public static let instantActivity = localizedString(for: "instant_activity")
    
    // MARK: - Tabs
    public static let homeTabTitle = localizedString(for: "home_tab_title")
    public static let calendarTabTitle = localizedString(for: "calendar_tab_title")
    public static let workoutsTabTitle = localizedString(for: "workouts_tab_title")
    
    // MARK: - Muscle Groups
    public static let abs = localizedString(for: "mg_abs")
    public static let arms = localizedString(for: "mg_arms")
    public static let back = localizedString(for: "mg_back")
    public static let chest = localizedString(for: "mg_chest")
    public static let legs = localizedString(for: "mg_legs")
    public static let shoulders = localizedString(for: "mg_shoulders")
    
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
