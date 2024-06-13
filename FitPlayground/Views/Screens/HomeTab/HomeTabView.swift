//
//  HomeTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct HomeTabView: View {
    private let workouts = Array(1...3)
    
    var body: some View {
        ZStack {
            Color(.appPrimary)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 18) {
                    Text("\(.today)")
                        .font(.appTextHeader)
                        .foregroundStyle(Color(.textPrimary))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                
                LazyVStack(alignment: .leading) {
                    ForEach(workouts, id: \.self) { item in
                        Text("List Item \(item)")
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    HomeTabView()
}
