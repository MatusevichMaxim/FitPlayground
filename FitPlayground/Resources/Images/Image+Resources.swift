//
//  Image+Resources.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/12/24.
//

import SwiftUI

enum AppImageResourse: String {
    case home_tab_icon = "home_tab_ic"
    case calendar_tab_icon = "calendar_tab_ic"
    case dumbbell_tab_icon = "dumbbell_tab_ic"
    
    case square_pencil_icon = "square_pencil_ic"
    case bolt_icon = "bolt_ic"
    case folder_icon = "folder_ic"
    case bin_icon = "bin_ic"
    case bars_icon = "bars_ic"
    
    case human_filter_icon = "ic_filter_human"
    case abs_filter_icon = "ic_filter_abs"
    case arm_filter_icon = "ic_filter_arm"
    case back_filter_icon = "ic_filter_back"
    case chest_filter_icon = "ic_filter_chest"
    case leg_filter_icon = "ic_filter_leg"
    case shoulder_filter_icon = "ic_filter_shoulder"
    case equipment_filter_icon = "ic_filter_all-equipment"
    case no_filter_equipment_icon = "ic_filter_no-equipment"
    case barbell_filter_icon = "ic_filter_barbell"
    case dumbbell_filter_icon = "ic_filter_dumbell"
    case machine_filter_icon = "ic_filter_machine"
    case band_filter_icon = "ic_filter_band"
    case kettlebell_filter_icon = "ic_filter_kettlebell"
    case cardio_filter_icon = "ic_filter_cardio"
    case other_filter_icon = "ic_filter_dots"
}

extension Image {
    init(_ resourse: AppImageResourse) {
        self.init(resourse.rawValue)
    }
}
