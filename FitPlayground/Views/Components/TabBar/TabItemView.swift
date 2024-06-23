//
//  TabItemView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/22/24.
//

import SwiftUI

struct TabItemView: View {
    private var isSelected: Bool {
        selection == data
    }
    
    @Binding var selection: TabItem
    let data: TabItem
    
    var body: some View {
        ZStack {
            Image(data.icon)
                .resizable()
                .foregroundStyle(isSelected ? Color.textPrimaryReversed : Color.textPrimary)
                .background(isSelected ? Color.appAccent : .clear)
                .frame(width: 40, height: 40)
                .cornerRadius(Constants.cornerRadius)
                .allowsHitTesting(false)
        }
        .frame(maxWidth: .infinity)
    }
}

extension TabItemView {
    private enum Constants {
        static let cornerRadius: CGFloat = 12.0
    }
}

#Preview {
    TabItemView(selection: .constant(.home), data: .home)
        .previewLayout(.sizeThatFits)
        .padding()
}
