//
//  CalendarTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct CalendarTabView: View {
    @State private var data: [Int] = Array(0..<21)
    
    var body: some View {
        ZStack {
            Color.appBg
                .ignoresSafeArea()
            
            AutoInfiniteScroll(
                data,
                id: \.self,
                initialFirstVisibleItem: 3,
                onLoadPrev: {
                    Task {
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        let min = data.min() ?? 0
                        data.insert(contentsOf: (min-14..<min), at: 0)
                    }
                },
                onLoadMore: {
                    Task {
                        try? await Task.sleep(nanoseconds: 1_000_000_000)
                        let max = data.max() ?? 0
                        data.append(contentsOf: (max+1..<max+15))
                    }
                },
                spacing: StyleManager.cellSpacing,
                enableLoadPrev: true,
                enableLoadMore: true,
                loader: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .tint(.yellow)
                }
            ) { data in
                AddWorkoutCell(action: {})
                    .frame(maxWidth: .infinity)
                    .frame(height: StyleManager.cellHeight)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    CalendarTabView()
}
