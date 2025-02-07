import SwiftUI

struct FocusView: View {
    var body: some View {
        NavigationView {
            FocusDashboard()
                .navigationTitle("Focus")
        }
    }
}

struct FocusDashboard: View {
    var body: some View {
        Text("Focus Features Coming Soon")
    }
} 