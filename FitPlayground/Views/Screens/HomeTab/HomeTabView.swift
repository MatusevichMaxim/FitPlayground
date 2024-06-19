//
//  HomeTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct HomeTabView: View {
    @State private var headerOpacity: CGFloat = 0
    
    let workoutsInfo: [Workout]
    
    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            
            VStack {
                AnimatedGradientView()
                    .frame(height: Constants.headerHeight * 2)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: Constants.headerHeight)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        Text("\(.today)")
                            .font(.appTextHeader1)
                            .foregroundStyle(Color.textPrimary)
                            .padding(.top, 24)
                            .padding(.horizontal, 32)
                        
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(workoutsInfo, id: \.self) { info in
                                WorkoutCell(data: info)
                            }
                            
                            AddWorkoutCell()
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 32)
                    }
                    .background(Color.appPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .cornerRadius(StyleManager.dialogRadius, for: [.topLeft, .topRight])
                }
                .background(GeometryReader { proxy in
                    Color.clear.preference(
                        key: ScrollOffsetPreferenceKey.self,
                        value: proxy.frame(in: .named("scroll")).origin
                    )
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: { value in
                    self.updateHeaderOpacity(for: value.y)
                })
            }
            .scrollIndicators(.hidden)
            .coordinateSpace(name: "scroll")
            .shadow(color: .appPrimary, radius: 10, y: 5)
            .overlay {
                ZStack {
                    Color.clear
                        .frame(height: Constants.navigationBarHeight)
                        .background(.ultraThinMaterial)
                        .opacity(headerOpacity)
                        .blur(radius: Constants.navigationBarBlurRadius)
                        .ignoresSafeArea(edges: .top)
                    
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                        
                        Text("Good morning,")
                            .font(.appTextCaption2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, StyleManager.contentExternalOffset )
                }
                .frame(maxHeight: .infinity, alignment: .top )
            }
        }
    }
    
    private func updateHeaderOpacity(for scrollPositionY: CGFloat) {
        let position = max(min(-scrollPositionY, Constants.headerHeight), 0)
        headerOpacity = position / Constants.headerHeight
    }
}

extension HomeTabView {
    private enum Constants {
        static let headerHeight: CGFloat = 160
        static let navigationBarHeight: CGFloat = 52
        static let navigationBarBlurRadius: CGFloat = 0.5
    }
}

#Preview {
    HomeTabView(workoutsInfo: [
        .init(name: "Core Engager 🎯", duration: 27, muscleGroups: [.abs, .back, .chest], status: .completed),
        .init(name: "Chair Rounds!", duration: 11, muscleGroups: [.legs, .back], status: .active),
        .init(name: "Leg Day", duration: 39, muscleGroups: [.legs], status: .active)
    ])
}
