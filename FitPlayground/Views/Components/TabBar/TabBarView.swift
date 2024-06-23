//
//  TabBarView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/22/24.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack {
            ForEach(TabItem.allCases, id: \.self) { item in
                TabItemView(selection: $selectedTab, data: item)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .bottom)
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.home))
        .previewLayout(.sizeThatFits)
        .padding()
}
