//
//  HomeTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct HomeTabView: View {
    @State private var headerOpacity: CGFloat = 0
    @State private var isShowingCreationSheet = false // TODO: move to VM
    
    @ObservedObject var viewModel: HomeTabViewModel
    
    var body: some View {
        ZStack {
            Color.appPrimary.ignoresSafeArea()
            
            VStack {
                ZStack {
                    AnimatedGradientView()
                    
                    VStack {
                        Text(String.firstSloganTitle)
                            .font(.appTextAltHeader1)
                            .foregroundStyle(Color.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 8) {
                            Text(String.firstSloganSubtitle)
                                .font(.appTextHeader1)
                                .foregroundStyle(Color.textPrimary)
                                .scaledToFit()
                            
                            Text(String.potential.lowercased())
                                .font(.appTextHeader1)
                                .foregroundStyle(Color.appAccent100)
                                .scaledToFit()
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 20)
                }
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
                            .font(.appTextHeader2)
                            .foregroundStyle(Color.textPrimary)
                            .padding(.top, 24)
                            .padding(.horizontal, 32)
                        
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.workouts, id: \.self) { info in
                                WorkoutCell(data: info)
                            }
                            
                            AddWorkoutCell(action: {
                                isShowingCreationSheet = true
                            })
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
                    GeometryReader { proxy in
                        Color.appBg.opacity(0.5)
                            .frame(height: Constants.navigationBarHeight + proxy.safeAreaInsets.top)
                            .background(.ultraThinMaterial)
                            .opacity(headerOpacity)
                            .blur(radius: Constants.navigationBarBlurRadius)
                            .ignoresSafeArea(edges: .top)
                        
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(Color.textPrimary)
                            
                            VStack {
                                Text("\(String.greetingsMorning),")
                                    .font(.appTextCaption2)
                                    .foregroundStyle(Color.textSecondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("User Name")
                                    .font(.appTextHeader6)
                                    .foregroundStyle(Color.textPrimary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.horizontal, StyleManager.contentExternalOffset )
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top )
            }
            
//            ActionSheetView(isShowing: $isShowingCreationSheet, data: PreviewData.actionSheetCreateNew)
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
    HomeTabView(viewModel: .init())
}
