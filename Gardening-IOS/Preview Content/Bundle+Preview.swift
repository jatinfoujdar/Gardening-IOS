import Foundation

extension Bundle {
    static var preview: Bundle {
        return Bundle(for: PreviewBundleToken.self)
    }
}

private class PreviewBundleToken {} 