import OSLog

public struct Log: Sendable {
    private let logger: Logger

    // MARK: - Categories

    public static let userInterface = Log(category: "UI")
    public static let network = Log(category: "Network")
    public static let data = Log(category: "Data")
    public static let navigation = Log(category: "Navigation")
    public static let general = Log(category: "General")

    // MARK: - Initialization

    private init(category: String, subsystem: String = Bundle.main.bundleIdentifier ?? "com.app") {
        self.logger = Logger(subsystem: subsystem, category: category)
    }

    // MARK: - Logging Methods

    public func debug(_ message: String) {
        logger.debug("\(message, privacy: .public)")
    }

    public func info(_ message: String) {
        logger.info("\(message, privacy: .public)")
    }

    public func error(_ message: String) {
        logger.error("\(message, privacy: .public)")
    }

    public func fault(_ message: String) {
        logger.fault("\(message, privacy: .public)")
    }
}
