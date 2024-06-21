//
//  ActionCancelButton.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/20/24.
//

import SwiftUI

struct ActionCancelModel {
    let showsDeleteOption: Bool
    let cancelTitle: String
}

struct ActionCancelButton: View {
    let data: ActionCancelModel
    
    var body: some View {
        HStack(spacing: 16) {
            
        }
    }
}

#Preview {
    ActionCancelButton(data: .init(showsDeleteOption: true, cancelTitle: String.cancel))
        .previewLayout(.sizeThatFits)
        .padding()
}
