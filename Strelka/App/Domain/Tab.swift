enum Tab: String, CaseIterable {
    case routes = "Routes"
}

extension Tab {
    var symbol: String {
        switch self {
        case .routes:
            return "hare"
        }
    }
}
