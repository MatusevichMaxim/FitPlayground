//
//  FilterStateModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

struct FilterStateModel<Filter: FilterType> {
    var filter: Filter
    var isSelected: Bool
}
