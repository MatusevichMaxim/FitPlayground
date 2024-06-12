//
//  HomeTabView.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.yellow)
            Text("\(2)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
