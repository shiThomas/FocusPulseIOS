import SwiftUI

struct RewardsView: View {
    var body: some View {
        NavigationView {
            RewardsDashboard()
                .navigationTitle("Rewards")
        }
    }
}

struct RewardsDashboard: View {
    var body: some View {
        Text("Rewards Coming Soon")
    }
} 