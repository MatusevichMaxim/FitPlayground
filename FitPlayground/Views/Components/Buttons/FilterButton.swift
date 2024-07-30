//
//  FilterButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/16/24.
//

import SwiftUI

struct FilterButton: View {
    private var isHighlighted: Bool { activeFilters > 0 }
    
    @Binding var activeFilters: Int
    
    var body: some View {
        ActionButton(action: {}) {
            HStack {
                if isHighlighted {
                    Text("\(activeFilters)")
                        .font(.ms_semibold_17)
                        .foregroundStyle(Color.appAccent)
                }
                
                Image(.bars_icon)
                    .foregroundStyle(isHighlighted ? Color.appAccent : Color.textPrimary)
                    .frame(width: 16, height: 16)
            }
            .padding(.horizontal, 14)
            .frame(height: 44)
            .background(Color.appPrimary800)
            .cornerRadius(StyleManager.cellRadius)
            .overlay(
                RoundedRectangle(
                    cornerRadius: StyleManager.cellRadius - Constants.borderPadding,
                    style: .continuous
                )
                .stroke(isHighlighted ? Color.appAccent : Color.clear, lineWidth: 3)
                .padding(Constants.borderPadding)
            )
        }
    }
}

extension FilterButton {
    private enum Constants {
        static let borderPadding: CGFloat = 1.5
    }
}

#Preview {
    FilterButton(activeFilters: .constant(1))
}
