//
//  TrainingTabView.swift
//  FitPlayground
//
//  Created by Максим Матусевич on 10/28/23.
//

import SwiftUI

struct TrainingTabView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
            Text("\(1)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct TrainingTabView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingTabView()
    }
}
