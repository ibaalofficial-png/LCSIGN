import Foundation

struct SourceApp: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var bundleID: String
    var iconURL: URL?
    var versions: [AppVersion]
}

struct AppVersion: Identifiable, Hashable, Codable {
    let id: UUID
    var version: String
    var build: String
    var downloadURL: URL
}

struct AppSource: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var url: URL
    var apps: [SourceApp]
}

enum AppTab: String, CaseIterable, Identifiable {
    case home = "Home", sources = "Sources", library = "Library", settings = "Settings"
    var id: String { rawValue }
    var systemImage: String {
        switch self { case .home: "house.fill"; case .sources: "square.stack.3d.up.fill"; case .library: "shippingbox.fill"; case .settings: "gearshape.fill" }
    }
}
