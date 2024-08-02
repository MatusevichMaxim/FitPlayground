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
    @State private var selectedMuscleGroupFilter: FilterModel?
    @State private var selectedEquipmentFilter: FilterModel?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.appPrimary900.ignoresSafeArea()
                
                List {
                    Section {
                        ForEach(viewModel.filtersManager.muscleGroupModels) { filter in
                            if let subfilters = filter.subfilters {
                                DisclosureGroup {
                                    ForEach(subfilters) { subfilter in
                                        makeItem(
                                            for: subfilter,
                                            selectedItem: selectedMuscleGroupFilter,
                                            action: { onMuscleGroupFilterTapped(subfilter) }
                                        )
                                        .listRowBackground(Color.appPrimary900.opacity(0.5))
                                        .listRowInsets(.init(top: 6, leading: 38, bottom: 6, trailing: 20))
                                    }
                                } label: {
                                    makeItem(
                                        for: filter,
                                        selectedItem: selectedMuscleGroupFilter,
                                        action: { onMuscleGroupFilterTapped(filter) }
                                    )
                                }
                                .listRowBackground(Color.appPrimary800)
                                .listRowInsets(.init(top: 6, leading: 8, bottom: 6, trailing: 20))
                            } else {
                                makeItem(
                                    for: filter,
                                    selectedItem: selectedMuscleGroupFilter,
                                    action: { onMuscleGroupFilterTapped(filter) }
                                )
                                .listRowBackground(Color.appPrimary800)
                                .listRowInsets(.init(top: 6, leading: 8, bottom: 6, trailing: 20))
                            }
                        }
                    } header: {
                        Text(String.muscleGroup)
                            .font(.ms_bold_17)
                            .foregroundStyle(Color.appPrimary600)
                    }
                    .headerProminence(.increased)
                    .listRowSeparatorTint(Color.appPrimary600)
                    .cornerRadius(16)
                    
                    Section {
                        ForEach(viewModel.filtersManager.equipmentModels) { filter in
                            makeItem(
                                for: filter,
                                selectedItem: selectedEquipmentFilter,
                                action: { onEquipmentFilterTapped(filter) }
                            )
                            .listRowBackground(Color.appPrimary800)
                            .listRowInsets(.init(top: 6, leading: 8, bottom: 6, trailing: 20))
                        }
                    } header: {
                        Text(String.equipment)
                            .font(.ms_bold_17)
                            .foregroundStyle(Color.appPrimary600)
                    }
                    .headerProminence(.increased)
                    .listRowSeparatorTint(Color.appPrimary600)
                }
                .tint(Color.textPrimary)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBar(
                title: String.filters,
                leftItem: .text(text: String.reset, color: .appRed, action: {}),
                rightItem: .text(text: String.done, color: .appGreen, action: {})
            )
        }
    }
    
    private func onMuscleGroupFilterTapped(_ filter: FilterModel) {
        if filter == selectedMuscleGroupFilter {
            selectedMuscleGroupFilter = nil
        } else {
            selectedMuscleGroupFilter = filter
        }
    }
    
    private func onEquipmentFilterTapped(_ filter: FilterModel) {
        if filter == selectedEquipmentFilter {
            selectedEquipmentFilter = nil
        } else {
            selectedEquipmentFilter = filter
        }
    }
}

extension FiltersSelectorView {
    private func makeItem(
        for filter: FilterModel,
        selectedItem: FilterModel?,
        action: @escaping () -> Void
    ) -> some View {
        HStack {
            HStack {
                if let icon = filter.icon {
                    Image(icon).foregroundStyle(Color.textPrimary)
                }
                
                Text(filter.name)
                    .font(.ms_bold_17)
                    .foregroundStyle(Color.textPrimary)
                
                Spacer()
            }
            .frame(width: 250)
            .contentShape(Rectangle())
            .onTapGesture(perform: action)
            
            Spacer()
            
            if filter == selectedItem {
                Image(systemName: "checkmark")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(Color.appGreen)
            } else if filter.subfilters?.first(where: { $0 == selectedItem }) != nil {
                Image(systemName: "minus")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(Color.appGreen)
            }
        }
        .frame(height: 40)
    }
}

#Preview {
    let filtersManager = FiltersManager()
    
    return FiltersSelectorView(viewModel: .init(filtersManager: filtersManager))
}
