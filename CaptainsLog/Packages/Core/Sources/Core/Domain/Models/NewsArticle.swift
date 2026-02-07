import Foundation

public struct NewsArticle: Identifiable, Hashable, Sendable {
    public let id: UUID
    public let title: String
    public let summary: String
    public let content: String
    public let date: Date
    
    public init(id: UUID = UUID(), title: String, summary: String, content: String, date: Date = Date()) {
        self.id = id
        self.title = title
        self.summary = summary
        self.content = content
        self.date = date
    }
}
