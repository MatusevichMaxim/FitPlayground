//
//  SettingsTabView.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import SwiftUI

struct SettingsTabView: View {
    var body: some View {
        ZStack {
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
        SettingsTabView()
    }
}
