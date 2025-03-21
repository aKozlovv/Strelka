public protocol ErrorInterface {
    var errorCode: Int { get }
    var errorDescription: String { get }
    var errorDetails: String? { get }
    var failureReason: String? { get }
}
