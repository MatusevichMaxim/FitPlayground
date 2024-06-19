//
//  AnimatedGradientView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/19/24.
//

import SwiftUI

struct AnimatedGradientView: View {
    @State private var timer = Timer
        .publish(every: Constants.timerDuration, on: .main, in: .common)
        .autoconnect()
    
    @ObservedObject private var animator = GradientAnimator(colors:
        [
            Color.gradientAnimationRed,
            Color.gradientAnimationYellow,
            Color.gradientAnimationBlue
        ]
    )
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position)
                        .foregroundStyle(circle.color)
                }
            }
        }
        .background(Color.appBg)
        .blur(radius: Constants.blurRadius)
        .ignoresSafeArea()
        .onAppear {
            startAnimation()
            timer = Timer
                .publish(every: Constants.timerDuration, on: .main, in: .common)
                .autoconnect()
        }
        .onReceive(timer) { _ in
            startAnimation()
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
    
    private func startAnimation() {
        withAnimation(.easeInOut(duration: Constants.animationSpeed)) {
            animator.animate()
        }
    }
}

extension AnimatedGradientView {
    private enum Constants {
        static let animationSpeed: Double = 4.0
        static let timerDuration: TimeInterval = 3
        static let blurRadius: CGFloat = 130.0
    }
}

#Preview {
    AnimatedGradientView()
        .previewLayout(.sizeThatFits)
        .padding()
}

private struct MovingCircle: Shape {
    var originOffset: CGPoint
    var animatableData: CGPoint.AnimatableData {
        get {
            originOffset.animatableData
        }
        set {
            originOffset.animatableData = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let adjustedX = rect.width * originOffset.x
        let adjustedY = rect.height * originOffset.y
        let smallestDimention = min(rect.width, rect.height)
        
        var path = Path()
        path.addArc(
            center: .init(x: adjustedX, y: adjustedY),
            radius: smallestDimention / 2,
            startAngle: .zero,
            endAngle: .degrees(360),
            clockwise: true
        )
        return path
    }
}

private class GradientAnimator: ObservableObject {
    class Circle: Identifiable {
        let id = UUID()
        var position: CGPoint
        let color: Color
        
        internal init(position: CGPoint, color: Color) {
            self.position = position
            self.color = color
        }
    }
    
    @Published private(set) var circles: [Circle] = []
    
    init(colors: [Color]) {
        circles = colors.map {
            Circle(position: GradientAnimator.getRandomPosition(), color: $0)
        }
    }
    
    func animate() {
        objectWillChange.send()
        circles.forEach {
            $0.position = GradientAnimator.getRandomPosition()
        }
    }
    
    private static func getRandomPosition() -> CGPoint {
        .init(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))
    }
}
