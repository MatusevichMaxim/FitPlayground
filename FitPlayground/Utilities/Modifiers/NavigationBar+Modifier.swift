//
//  NavigationBar+Modifier.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import SwiftUI

enum NavigationBarItem {
    case close(action: VoidClosure)
    case text(text: String, color: Color, action: VoidClosure)
}

struct NavigationBarModifier: ViewModifier {
    let title: String?
    let leftItem: NavigationBarItem?
    let rightItem: NavigationBarItem?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                if let title {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text(title)
                                .font(.ms_semibold_16)
                                .foregroundColor(.textPrimary)
                        }
                    }
                }
                
                if let leftItem {
                    makeToolbarItem(using: leftItem, placement: .topBarLeading)
                }
                
                if let rightItem {
                    makeToolbarItem(using: rightItem, placement: .topBarTrailing)
                }
            }
    }
    
    @ToolbarContentBuilder
    private func makeToolbarItem(using item: NavigationBarItem, placement: ToolbarItemPlacement) -> some ToolbarContent {
        ToolbarItem(placement: placement, content: {
            switch item {
            case .close(let action):
                Button(action: action, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.textPrimary)
                })
            case .text(let text, let color, let action):
                Button(action: action, label: {
                    Text(text)
                        .backgroundStyle(color)
                })
            }
        })
    }
}

extension View {
    func navigationBar(
        title: String? = nil,
        leftItem: NavigationBarItem? = nil,
        rightItem: NavigationBarItem? = nil
    ) -> some View {
        modifier(NavigationBarModifier(title: title, leftItem: leftItem, rightItem: rightItem))
    }
}
