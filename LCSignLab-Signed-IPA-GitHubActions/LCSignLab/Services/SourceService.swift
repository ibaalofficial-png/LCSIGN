import Foundation
import UIKit

struct SourceService {
    func copyLink(_ url: URL) {
        UIPasteboard.general.url = url
    }
}
