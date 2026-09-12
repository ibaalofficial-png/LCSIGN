import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section("Interface") {
                Label("iOS 26 Liquid Glass", systemImage: "circle.hexagongrid.fill")
                Label("ProMotion-friendly animations", systemImage: "gauge.with.dots.needle.67percent")
            }
            Section("Signing") {
                Text("Signing engine: modular / not bundled in this UI prototype")
                    .foregroundStyle(.secondary)
            }
            Section("Research") {
                Text("ElleKit / jailbreak integrations can be added as a separate diagnostic adapter where supported. No new exploit or bypass mechanism is included.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Settings")
    }
}
