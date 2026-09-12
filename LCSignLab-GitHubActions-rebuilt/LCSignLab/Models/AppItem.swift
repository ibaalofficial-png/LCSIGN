import Foundation

struct AppItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let bundleIdentifier: String
    let version: String
    let sourceURL: URL?
}
