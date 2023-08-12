import Foundation

extension DateFormatter {
    static let sharedRFC822 = RFC822DateFormatter()
    static let sharedRFC3339 = RFC3339DateFormatter()
    static let sharedISO8601 = ISO8601DateFormatter()
}
