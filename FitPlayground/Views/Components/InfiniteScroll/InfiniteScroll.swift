import SwiftUI

struct InfiniteScroll<Data, ID, Content, Loader>: View
where Data: RandomAccessCollection, ID: Hashable, Content: View, Loader: View {
    
    let data: Data
    let id: KeyPath<Data.Element, ID>
    let initialFirstVisibleItem: ID?
    let onLoadPrev: () -> Void
    let onLoadMore: () -> Void
    let spacing: CGFloat
    let enableLoadPrev: Bool
    let enableLoadMore: Bool
    
    @ViewBuilder let makeLoader: () -> Loader
    @ViewBuilder let content: (Data.Element) -> Content
    
    @State private var scrollPosition: ID?
    @State private var loading: Bool = false
    @State private var topAppeared = false
    @State private var loadPrevViewHeight: CGFloat?
    @State private var loadMoreViewHeight: CGFloat?
    @State private var topOffset: CGFloat?
    @State private var bottomOffset: CGFloat?
    @State private var scrollToInitial = true
    
    private let coordinateSpace: String = "infinite_scroll"
}
 
extension InfiniteScroll {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: spacing) {
                ForEach(data, id: id) {
                    content($0)
                        .id($0[keyPath: id])
                        .background(Color.orange)
                }
            }
            .scrollTargetLayout()
            .padding(.top, enableLoadPrev ? loadPrevViewHeight : nil)
            .padding(.bottom, enableLoadMore ? loadMoreViewHeight : nil)
            .background {
                GeometryReader { proxy -> Color in
                    onScroll(proxy: proxy)
                    
                    return Color.clear
                }
            }
        }
        .scrollPosition(id: $scrollPosition)
        .coordinateSpace(name: coordinateSpace)
        .overlay(alignment: .top) {
            if enableLoadPrev {
                makeLoader()
                    .readGeometry {
                        if loadPrevViewHeight != $0.height {
                            loadPrevViewHeight = $0.height
                        }
                    }
                    .offset(y: -(topOffset ?? 1000))
            }
        }
        .overlay(alignment: .bottom) {
            if enableLoadMore {
                makeLoader()
                    .readGeometry {
                        if loadMoreViewHeight != $0.height {
                            loadMoreViewHeight = $0.height
                        }
                    }
                    .offset(y: bottomOffset ?? 1000)
            }
        }
        .clipped()
        .onAppear(perform: initialScroll)
        .onChange(of: data.count) { oldValue, newValue in
            if newValue < oldValue {
                scrollToInitial = true
                initialScroll()
            } else if loading {
                Task { @MainActor in
                    try? await Task.sleep(nanoseconds: 100_000_000)
                    loading = false
                }
            }
        }
    }
    
    private func onScroll(proxy: GeometryProxy) {
        guard let bound = proxy.bounds(of: .named(coordinateSpace)) else { return }

        let topOffset = bound.minY
        let contentHeight = proxy.frame(in: .global).height
        let bottomOffset = contentHeight - bound.maxY

        Task { @MainActor in
            if self.topOffset != topOffset {
                self.topOffset = topOffset
            }
            
            if self.bottomOffset != bottomOffset {
                self.bottomOffset = bottomOffset
            }
            
            if loading { return }
            
            // TODO: fix hard code 0.8
            if let loadPrevViewHeight, enableLoadPrev {
                if topOffset <= loadPrevViewHeight * 0.8 && topOffset >= 0 {
                    if topAppeared {
                        loading = true
                        onLoadPrev()
                    }
                }
            }
            if let loadPrevViewHeight, enableLoadMore {
                if bottomOffset <= loadPrevViewHeight * 0.8 && topOffset >= 0 {
                    loading = true
                    onLoadMore()
                }
            }
        }
    }
    
    private func initialScroll() {
        let first: ID?
        if initialFirstVisibleItem != nil {
            first = initialFirstVisibleItem
        } else {
            first = data.first?[keyPath: id]
        }
        
        if scrollToInitial {
            scrollToInitial = false
            scrollPosition = first
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 100_000_000)
                topAppeared = true
            }
        }
    }
}
