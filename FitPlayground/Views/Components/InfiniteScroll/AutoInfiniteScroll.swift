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
    private let onLoadMore: () -> Void
    private let spacing: CGFloat
    private let enableLoadPrev: Bool
    private let enableLoadMore: Bool
    
    @ViewBuilder private let makeLoader: () -> Loader
    @ViewBuilder private let content: (Data.Element) -> Content
    
    init(
        _ data: Data,
        id: KeyPath<Data.Element, ID>,
        initialFirstVisibleItem: ID? = nil,
        onLoadPrev: @escaping () -> Void,
        onLoadMore: @escaping () -> Void,
        spacing: CGFloat = 0,
        enableLoadPrev: Bool = true,
        enableLoadMore: Bool = true,
        @ViewBuilder loader: @escaping () -> Loader,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.id = id
        self.initialFirstVisibleItem = initialFirstVisibleItem
        self.onLoadPrev = onLoadPrev
        self.onLoadMore = onLoadMore
        self.spacing = spacing
        self.enableLoadPrev = enableLoadPrev
        self.enableLoadMore = enableLoadMore
        self.makeLoader = loader
        self.content = content
    }
    
    var body: some View {
        InfiniteScroll(
            data: data,
            id: id,
            initialFirstVisibleItem: initialFirstVisibleItem,
            onLoadPrev: onLoadPrev,
            onLoadMore: onLoadMore,
            spacing: spacing,
            enableLoadPrev: enableLoadPrev,
            enableLoadMore: enableLoadMore,
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
