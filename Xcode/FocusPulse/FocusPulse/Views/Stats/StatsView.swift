import SwiftUI

struct StatsView: View {
    var body: some View {
        NavigationView {
            StatsDashboard()
                .navigationTitle("Stats")
        }
    }
}

struct StatsDashboard: View {
    var body: some View {
        Text("Statistics Coming Soon")
    }
} 