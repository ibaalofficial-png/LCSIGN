import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView().tabItem {
                Label("Home", systemImage: "house.fill")
            }.tag(0)

            AppsView().tabItem {
                Label("Apps", systemImage: "square.grid.2x2.fill")
            }.tag(1)

            SourcesView().tabItem {
                Label("Sources", systemImage: "globe")
            }.tag(2)

            LibraryView().tabItem {
                Label("Library", systemImage: "folder.fill")
            }.tag(3)

            SettingsView().tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }.tag(4)
        }
    }
}

private struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("LCSignLab")
                            .font(.largeTitle.bold())
                        Text("IPA workspace & signing lab")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 12)
                }
                Section("Quick actions") {
                    Label("Import IPA", systemImage: "square.and.arrow.down")
                    Label("Certificates", systemImage: "checkmark.seal")
                    Label("Sources", systemImage: "globe")
                }
            }
            .navigationTitle("Home")
        }
    }
}

private struct AppsView: View {
    private let apps = [
        AppItem(name: "Example App", bundleIdentifier: "com.example.app",
                version: "1.0", sourceURL: URL(string: "https://example.com/app.ipa"))
    ]

    var body: some View {
        NavigationStack {
            List(apps) { app in
                VStack(alignment: .leading, spacing: 4) {
                    Text(app.name).font(.headline)
                    Text(app.bundleIdentifier)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .contextMenu {
                    Button { } label: {
                        Label("Install", systemImage: "arrow.down.circle")
                    }
                    if let url = app.sourceURL {
                        Button {
                            SourceService().copyLink(url)
                        } label: {
                            Label("Copy Link", systemImage: "link")
                        }
                    }
                    Button { } label: {
                        Label("Versions", systemImage: "clock.arrow.circlepath")
                    }
                }
            }
            .navigationTitle("Apps")
        }
    }
}

private struct SourcesView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "No Sources",
                systemImage: "globe",
                description: Text("Add a compatible app source to populate the catalog.")
            )
            .navigationTitle("Sources")
        }
    }
}

private struct LibraryView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Library Empty",
                systemImage: "folder",
                description: Text("Imported IPA files will appear here.")
            )
            .navigationTitle("Library")
        }
    }
}

private struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("Appearance") {
                    Label("iOS 26 Liquid Glass", systemImage: "circle.hexagongrid.fill")
                    Label("ProMotion-friendly animations", systemImage: "sparkles")
                }
                Section("About") {
                    Text("LCSignLab 1.0")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
