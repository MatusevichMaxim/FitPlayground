//
//  AutoInfiniteScroll.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/28/24.
//

import SwiftUI

struct AutoInfiniteScroll<Data, ID, Content, Loader>: View
where Data: RandomAccessCollection, ID: Hashable, Content: View, Loader: View {
    private let data: Data
    private let id: KeyPath<Data.Element, ID>
    private let initialFirstVisibleItem: ID?
    private let onLoadPrev: () -> Void
    private let onLoadNext: () -> Void
    private let spacing: CGFloat
    private let enablePrevLoading: Bool
    private let enableNextLoading: Bool
    
    @ViewBuilder private let makeLoader: () -> Loader
    @ViewBuilder private let content: (Data.Element) -> Content
    
    init(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        initialFirstVisibleItem: ID? = nil,
        onLoadPrev: @escaping () -> Void,
        onLoadNext: @escaping () -> Void,
        spacing: CGFloat = 0,
        enablePrevLoading: Bool = true,
        enableNextLoading: Bool = true,
        @ViewBuilder loader: @escaping () -> Loader,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.id = id
        self.initialFirstVisibleItem = initialFirstVisibleItem
        self.onLoadPrev = onLoadPrev
        self.onLoadNext = onLoadNext
        self.spacing = spacing
        self.enablePrevLoading = enablePrevLoading
        self.enableNextLoading = enableNextLoading
        self.makeLoader = loader
        self.content = content
    }
    
    var body: some View {
        InfiniteScroll(
            data: data,
            id: id,
            initialFirstVisibleItem: initialFirstVisibleItem,
            onLoadPrev: onLoadPrev,
            onLoadNext: onLoadNext,
            spacing: spacing,
            enablePrevLoading: enablePrevLoading,
            enableNextLoading: enableNextLoading,
            makeLoader: makeLoader,
            content: content
        )
    }
    
    private var defaultProgress: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
}
