//
//  FiltersSelectorView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import SwiftUI

struct FiltersSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: FiltersSelectorViewModel
    
    var body: some View {
        ZStack {
            Color.appPrimary900.ignoresSafeArea()
            
            List {
                Section {
                    ForEach(viewModel.filtersManager.muscleGroupFilterStateModels, id: \.filter) { model in
                        FilterItemCell(resource: model.filter.icon, title: model.filter.localizedName)
                    }
                } header: {
                    Text(String.muscleGroup)
                }
                
                Section {
                    ForEach(viewModel.filtersManager.equipmentFilterStateModels, id: \.filter) { model in
                        FilterItemCell(resource: model.filter.icon, title: model.filter.localizedName)
                    }
                } header: {
                    Text(String.equipment)
                }
            }
        }
    }
}

#Preview {
    let filtersManager = FiltersManager()
    
    return FiltersSelectorView(viewModel: .init(filtersManager: filtersManager))
}
