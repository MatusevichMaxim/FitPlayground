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
                    ForEach(viewModel.filtersManager.muscleGroupModels) { filter in
                        if let subfilters = filter.subfilters {
                            DisclosureGroup {
                                ForEach(subfilters) { subfilter in
                                    makeItemLabel(for: subfilter)
                                }
                            } label: {
                                makeItemLabel(for: filter)
                            }
                        } else {
                            makeItemLabel(for: filter)
                        }
                    }
                } header: {
                    Text(String.muscleGroup)
                        .font(.ms_bold_17)
                        .foregroundStyle(Color.textPrimary)
                }
                .headerProminence(.increased)
                
                Section {
                    ForEach(viewModel.filtersManager.equipmentModels) { filter in
                        makeItemLabel(for: filter)
                    }
                } header: {
                    Text(String.equipment)
                        .font(.ms_bold_17)
                        .foregroundStyle(Color.textPrimary)
                }
                .headerProminence(.increased)
            }
            .tint(Color.textPrimary)
        }
    }
}

extension FiltersSelectorView {
    private func makeItemLabel(for filter: FilterModel) -> Label<Text, Image> {
        Label(
            title: {
                Text(filter.name)
                    .font(.ms_bold_17)
                    .foregroundStyle(Color.textPrimary)
            },
            icon: {
                Image(filter.icon ?? .bin_icon)
            }
        )
    }
}

#Preview {
    let filtersManager = FiltersManager()
    
    return FiltersSelectorView(viewModel: .init(filtersManager: filtersManager))
}
