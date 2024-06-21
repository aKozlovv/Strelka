enum Tab: String {
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
