import SwiftUI

struct AppDetailView: View {
    @EnvironmentObject private var store: AppStore
    let app: SourceApp
    @State private var showVersions = false
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GlassCard {
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 18).fill(.quaternary).frame(width: 72, height: 72).overlay(Image(systemName: "app.fill").font(.largeTitle))
                        VStack(alignment: .leading) { Text(app.name).font(.title2.bold()); Text(app.bundleID).font(.caption).foregroundStyle(.secondary) }
                        Spacer()
                    }
                }
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Actions").font(.headline)
                        Button { UIPasteboard.general.string = app.bundleID } label: { Label("Copy Bundle ID", systemImage: "doc.on.doc") }
                        Button { showVersions = true } label: { Label("Choose Version / Downgrade", systemImage: "clock.arrow.circlepath") }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.padding()
        }
        .navigationTitle(app.name)
        .sheet(isPresented: $showVersions) { VersionPickerView(app: app) }
    }
}

struct VersionPickerView: View {
    let app: SourceApp
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            List(app.versions) { version in
                VStack(alignment: .leading) {
                    Text(version.version).font(.headline)
                    Text("Build \(version.build)").font(.caption).foregroundStyle(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture { dismiss() }
            }
            .navigationTitle("Versions")
            .toolbar { Button("Done") { dismiss() } }
        }
    }
}
