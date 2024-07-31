//
//  SearchBar.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/16/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var filtersCount: Int
    let onFiltersTap: VoidClosure
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.appPrimary900
            
            HStack(spacing: 8) {
                ZStack(alignment: .leading) {
                    TextField("", text: $text, prompt: makePlaceholder())
                        .font(.ms_bold_16)
                        .foregroundStyle(Color.textPrimary)
                        .padding(.horizontal, 40)
                    
                    Text(Image(systemName: "magnifyingglass"))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.appPrimary800)
                        .padding(.leading, 14)
                }
                .frame(maxHeight: Constants.barHeight)
                .background(Color.appPrimary)
                .cornerRadius(Constants.cornerRadius)
                
                FilterButton(activeFilters: $filtersCount, tapAction: onFiltersTap)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: Constants.totalHeight)
    }
    
    private func makePlaceholder() -> Text {
        Text(String.searchByName)
            .font(.ms_bold_16)
            .foregroundStyle(Color.appPrimary800)
    }
}

extension SearchBar {
    private enum Constants {
        static let totalHeight: CGFloat = 76
        static let barHeight: CGFloat = 44
        static let cornerRadius: CGFloat = 18
    }
}

#Preview {
    SearchBar(text: .constant(""), filtersCount: .constant(1), onFiltersTap: {})
        .previewLayout(.sizeThatFits)
}
