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
        NavigationView {
            ZStack {
                Color.appPrimary900.ignoresSafeArea()
                
                List {
                    Section {
                        ForEach(viewModel.filtersManager.muscleGroupModels) { filter in
                            if let subfilters = filter.subfilters {
                                DisclosureGroup {
                                    ForEach(subfilters) { subfilter in
                                        makeItem(for: subfilter)
                                    }
                                } label: {
                                    makeItem(for: filter)
                                }
                            } else {
                                makeItem(for: filter)
                            }
                        }
                    } header: {
                        Text(String.muscleGroup)
                            .font(.ms_bold_17)
                            .foregroundStyle(Color.appPrimary600)
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        ForEach(viewModel.filtersManager.equipmentModels) { filter in
                            makeItem(for: filter)
                        }
                    } header: {
                        Text(String.equipment)
                            .font(.ms_bold_17)
                            .foregroundStyle(Color.appPrimary600)
                    }
                    .headerProminence(.increased)
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
}

extension FiltersSelectorView {
    private func makeItem(for filter: FilterModel) -> some View {
        HStack {
            if let icon = filter.icon {
                Image(icon)
                    .foregroundStyle(Color.textPrimary)
            }
            
            Text(filter.name)
                .font(.ms_bold_17)
                .foregroundStyle(Color.textPrimary)
        }
    }
}

#Preview {
    let filtersManager = FiltersManager()
    
    return FiltersSelectorView(viewModel: .init(filtersManager: filtersManager))
}
