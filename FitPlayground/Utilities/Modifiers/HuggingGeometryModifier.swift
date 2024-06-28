//
//  HuggingGeometryModifier.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/28/24.
//

import SwiftUI

private struct HuggingGeometryModifier: ViewModifier {
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGSize { CGSize() }
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
    }
    
    let onChange: (CGSize) -> ()
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(key: SizeKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizeKey.self) {
                onChange($0)
            }
    }
}

extension View {
    func readGeometry(onChange: @escaping (CGSize) -> ()) -> some View {
        modifier(HuggingGeometryModifier {
            onChange($0)
        })
    }
}
