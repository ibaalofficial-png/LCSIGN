import SwiftUI

struct LibraryView: View {
    var body: some View {
        ContentUnavailableView("Library", systemImage: "shippingbox", description: Text("Imported IPA files will appear here."))
            .navigationTitle("Library")
    }
}
