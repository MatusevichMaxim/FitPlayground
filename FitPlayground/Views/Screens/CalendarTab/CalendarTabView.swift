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
                viewModel.planData,
                id: \.self,
                initialFirstVisibleItem: viewModel.initialPlan,
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
                DayPlanCell(date: data.date, workouts: data.workouts)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    CalendarTabView(viewModel: .init())
}
