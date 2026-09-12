import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var store: AppStore
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("LCSignLab").font(.largeTitle.bold())
                    Text("IPA workspace • sources • versions").foregroundStyle(.secondary)
                }
                GlassCard {
                    HStack(spacing: 14) {
                        Image(systemName: "arrow.down.app.fill").font(.system(size: 30))
                        VStack(alignment: .leading) {
                            Text("Import IPA").font(.headline)
                            Text("Open an IPA from Files and add it to the workspace.").font(.subheadline).foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                }
                GlassCard {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Planned signing workspace", systemImage: "signature")
                        Text("Certificate/profile selection and local IPA processing are kept modular so the UI can be connected to a signing engine later.")
                            .font(.subheadline).foregroundStyle(.secondary)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Home")
    }
}
