import SwiftUI

public struct Skeleton {
    
    private let animation: Animation
    private let gradient: Gradient
    private let min, max: CGFloat
    private let mode: Mode
    
    @State
    private var isInitialState = true
    
    @Environment(\.layoutDirection)
    private var layoutDirection
    
    public init(
        animation: Animation = Self.defaultAnimation,
        gradient: Gradient = Self.defaultGradient,
        bandSize: CGFloat = 0.3,
        mode: Mode = .mask
    ) {
        self.animation = animation
        self.gradient = gradient
        self.min = 0 - bandSize
        self.max = 1 + bandSize
        self.mode = mode
    }
    
    public static let defaultAnimation = Animation.linear(duration: 1.5).delay(0.25).repeatForever(autoreverses: false)
    
    public static let defaultGradient = Gradient(colors: [
        .black.opacity(0.3),
        .black,
        .black.opacity(0.3)
    ])
    
    var startPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            isInitialState ? UnitPoint(x: max, y: min) : UnitPoint(x: 0, y: 1)
        } else {
            isInitialState ? UnitPoint(x: min, y: min) : UnitPoint(x: 1, y: 1)
        }
    }
    
    var endPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            isInitialState ? UnitPoint(x: 1, y: 0) : UnitPoint(x: min, y: max)
        } else {
            isInitialState ? UnitPoint(x: 0, y: 0) : UnitPoint(x: max, y: max)
        }
    }
}

extension Skeleton: ViewModifier {
    public func body(content: Content) -> some View {
        applyingGradient(to: content)
            .animation(animation, value: isInitialState)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    isInitialState = false
                }
            }
    }
    
    @ViewBuilder
    public func applyingGradient(to content: Content) -> some View {
        let gradient = LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
        switch mode {
        case .mask:
            content.mask(gradient)
        case let .overlay(blendMode: blendMode):
            content.overlay(gradient.blendMode(blendMode))
        case .background:
            content.background(gradient)
        }
    }
}

public extension Skeleton {
    enum Mode {
        case mask
        case overlay(blendMode: BlendMode = .sourceAtop)
        case background
    }
}

public extension View {
    @ViewBuilder
    func shimmering(
        if active: Bool,
        animation: Animation = Skeleton.defaultAnimation,
        gradient: Gradient = Skeleton.defaultGradient,
        bandSize: CGFloat = 0.3,
        mode: Skeleton.Mode = .mask
    ) -> some View {
        if active {
            modifier(Skeleton(animation: animation, gradient: gradient, bandSize: bandSize, mode: mode))
                .redacted(reason: .placeholder)
        } else {
            self
        }
    }
}

