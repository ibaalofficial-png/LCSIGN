import Foundation

struct AppItem: Identifiable, Hashable {
    let id: UUID
    let name: String
    let bundleIdentifier: String
    let version: String
    let sourceURL: URL?

    init(
        id: UUID = UUID(),
        name: String,
        bundleIdentifier: String,
        version: String,
        sourceURL: URL? = nil
    ) {
        self.id = id
        self.name = name
        self.bundleIdentifier = bundleIdentifier
        self.version = version
        self.sourceURL = sourceURL
    }
}
