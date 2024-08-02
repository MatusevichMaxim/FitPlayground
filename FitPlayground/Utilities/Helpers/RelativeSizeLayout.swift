//
//  RelativeSizeLayout.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 8/1/24.
//

import SwiftUI

struct RelativeSizeLayout: Layout {
    var relativeWidth: Double
    var relativeHeight: Double
    
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        assert(subviews.count == 1, "expects a single subview")
        let resizedProposal = ProposedViewSize(
            width: proposal.width.map { $0 * relativeWidth },
            height: proposal.height.map { $0 * relativeHeight }
        )
        return subviews[0].sizeThatFits(resizedProposal)
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        assert(subviews.count == 1, "expects a single subview")
        let resizedProposal = ProposedViewSize(
            width: proposal.width.map { $0 * relativeWidth },
            height: proposal.height.map { $0 * relativeHeight }
        )
        subviews[0].place(
            at: CGPoint(x: bounds.midX, y: bounds.midY),
            anchor: .center,
            proposal: resizedProposal
        )
    }
}
