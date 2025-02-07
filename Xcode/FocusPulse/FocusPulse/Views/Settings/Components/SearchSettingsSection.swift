import SwiftUI

struct SearchSettingsSection: View {
    @AppStorage("quickSearchDuration") private var quickSearchDuration: TimeInterval = 300
    @AppStorage("deepSearchDuration") private var deepSearchDuration: TimeInterval = 1800
    @State private var quickSearchApps: Set<String> = ["Safari"]
    @State private var deepSearchApps: Set<String> = ["Safari"]
    
    var body: some View {
        Section(header: Text("Search Settings")) {
            QuickSearchSettings(
                duration: $quickSearchDuration,
                selectedApps: $quickSearchApps
            )
            DeepSearchSettings(
                duration: $deepSearchDuration,
                selectedApps: $deepSearchApps
            )
        }
    }
} 