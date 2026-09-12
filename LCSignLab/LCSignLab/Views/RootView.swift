import SwiftUI

struct RootView: View {
    @EnvironmentObject private var store: AppStore
    var body: some View {
        TabView(selection: $store.selectedTab) {
            NavigationStack { HomeView() }.tabItem { Label("Home", systemImage: "house.fill") }.tag(AppTab.home)
            NavigationStack { SourcesView() }.tabItem { Label("Sources", systemImage: "square.stack.3d.up.fill") }.tag(AppTab.sources)
            NavigationStack { LibraryView() }.tabItem { Label("Library", systemImage: "shippingbox.fill") }.tag(AppTab.library)
            NavigationStack { SettingsView() }.tabItem { Label("Settings", systemImage: "gearshape.fill") }.tag(AppTab.settings)
        }
        .tint(.primary)
    }
}
