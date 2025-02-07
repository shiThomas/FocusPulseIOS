import SwiftUI

struct SearchDashboardView: View {
    @AppStorage("quickSearchDuration") private var quickSearchDuration: TimeInterval = 300
    @AppStorage("deepSearchDuration") private var deepSearchDuration: TimeInterval = 1800
    @State private var selectedMode: SearchMode = .quick
    @State private var isSearchActive = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                SearchModePicker(selectedMode: $selectedMode)
                CurrentSettingsDisplay(selectedMode: selectedMode)
                StartSearchButton(action: startSearch)
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
    
    private func startSearch() {
        isSearchActive = true
        // Implementation for starting the search timer
    }
}

// Remove all component declarations from here 