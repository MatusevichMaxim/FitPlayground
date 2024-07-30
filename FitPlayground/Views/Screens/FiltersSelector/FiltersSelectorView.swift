//
//  FiltersSelectorView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import SwiftUI

struct FiltersSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: FiltersSelectorViewModel
    
    var body: some View {
        ZStack {
            Color.appPrimary900.ignoresSafeArea()
            
            List {
                
            }
        }
    }
}

#Preview {
    FiltersSelectorView(viewModel: .init())
}
