import SwiftUI

struct SourcesView: View {
    @EnvironmentObject private var store: AppStore
    @State private var showAdd = false
    var body: some View {
        List {
            ForEach(store.sources) { source in
                Section {
                    ForEach(source.apps) { app in
                        NavigationLink {
                            AppDetailView(app: app)
                        } label: {
                            Label(app.name, systemImage: "app.fill")
                        }
                        .contextMenu {
                            Button { UIPasteboard.general.string = source.url.absoluteString } label: { Label("Copy Source Link", systemImage: "link") }
                            Menu("Versions") {
                                ForEach(app.versions) { version in
                                    Button("\(version.version) (\(version.build))") {
                                        UIPasteboard.general.string = version.downloadURL.absoluteString
                                    }
                                }
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text(source.name)
                        Spacer()
                        Button { UIPasteboard.general.string = source.url.absoluteString } label: { Image(systemName: "doc.on.doc") }
                    }
                }
            }
        }
        .navigationTitle("Sources")
        .toolbar { Button { showAdd = true } label: { Image(systemName: "plus") } }
        .sheet(isPresented: $showAdd) { AddSourceView() }
    }
}

struct AddSourceView: View {
    @EnvironmentObject private var store: AppStore
    @Environment(\.dismiss) private var dismiss
    @State private var url = ""
    var body: some View {
        NavigationStack {
            Form { TextField("https://…/apps.json", text: $url).textInputAutocapitalization(.never).keyboardType(.URL) }
                .navigationTitle("Add Source")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
                    ToolbarItem(placement: .confirmationAction) { Button("Add") { store.addSource(url); dismiss() }.disabled(URL(string: url)?.scheme == nil) }
                }
        }
    }
}
