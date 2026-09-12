import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                Text("Home")
                    .navigationTitle("LCSignLab")
            }
            .tabItem { Label("Home", systemImage: "house") }

            NavigationStack {
                Text("Apps")
                    .navigationTitle("Apps")
            }
            .tabItem { Label("Apps", systemImage: "square.grid.2x2") }

            NavigationStack {
                Text("Sources")
                    .navigationTitle("Sources")
            }
            .tabItem { Label("Sources", systemImage: "globe") }

            NavigationStack {
                Text("Library")
                    .navigationTitle("Library")
            }
            .tabItem { Label("Library", systemImage: "folder") }

            NavigationStack {
                Text("Settings")
                    .navigationTitle("Settings")
            }
            .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .tint(.primary)
    }
}

#Preview {
    ContentView()
}
