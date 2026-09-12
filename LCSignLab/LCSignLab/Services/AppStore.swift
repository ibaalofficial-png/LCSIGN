import Foundation
import SwiftUI

@MainActor
final class AppStore: ObservableObject {
    @Published var selectedTab: AppTab = .home
    @Published var sources: [AppSource] = [
        AppSource(id: UUID(), name: "Example Source", url: URL(string: "https://example.com/apps.json")!, apps: [
            SourceApp(id: UUID(), name: "Demo App", bundleID: "com.example.demo", iconURL: nil, versions: [
                AppVersion(id: UUID(), version: "2.1.0", build: "210", downloadURL: URL(string: "https://example.com/demo.ipa")!),
                AppVersion(id: UUID(), version: "2.0.0", build: "200", downloadURL: URL(string: "https://example.com/demo-2.0.ipa")!)
            ])
        ])
    ]

    func copyLink(_ app: SourceApp) {
        guard let source = sources.first(where: { $0.apps.contains(app) }) else { return }
        UIPasteboard.general.string = source.url.absoluteString
    }

    func addSource(_ raw: String) {
        guard let url = URL(string: raw.trimmingCharacters(in: .whitespacesAndNewlines)),
              url.scheme != nil else { return }
        sources.append(AppSource(id: UUID(), name: url.host ?? "New Source", url: url, apps: []))
    }
}
