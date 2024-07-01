//
//  CalendarTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct CalendarTabView: View {
    @ObservedObject var viewModel: CalendarTabViewModel
    
    var body: some View {
        ZStack {
            Color.appBg
                .ignoresSafeArea()
            
            AutoInfiniteScroll(
                viewModel.calendarData,
                id: \.self,
                initialFirstVisibleItem: 3,
                onLoadPrev: viewModel.loadPrevWeeks,
                onLoadNext: viewModel.loadNextWeeks,
                spacing: StyleManager.cellSpacing,
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
    CalendarTabView(viewModel: .init())
}
