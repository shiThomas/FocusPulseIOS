import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                SearchSettingsSection()
                FocusSettingsSection()
                StatsSettingsSection()
                RewardsSettingsSection()
            }
            .navigationTitle("Settings")
        }
    }
}

struct FocusSettingsSection: View {
    var body: some View {
        Section(header: Text("Focus Settings")) {
            Text("Focus settings coming soon")
        }
    }
}

struct StatsSettingsSection: View {
    var body: some View {
        Section(header: Text("Stats Settings")) {
            Text("Stats settings coming soon")
        }
    }
}

struct RewardsSettingsSection: View {
    var body: some View {
        Section(header: Text("Rewards Settings")) {
            Text("Rewards settings coming soon")
        }
    }
} 