import SwiftUI

struct QuickSearchSettings: View {
    @Binding var duration: TimeInterval
    @Binding var selectedApps: Set<String>
    
    var body: some View {
        NavigationLink("Quick Search Settings") {
            Form {
                Section(header: Text("Duration")) {
                    DurationPicker(duration: $duration, options: [5, 10, 15, 20])
                }
                Section(header: Text("Apps")) {
                    AppSelectionList(selectedApps: $selectedApps)
                }
            }
            .navigationTitle("Quick Search")
        }
    }
}

struct DeepSearchSettings: View {
    @Binding var duration: TimeInterval
    @Binding var selectedApps: Set<String>
    
    var body: some View {
        NavigationLink("Deep Search Settings") {
            Form {
                Section(header: Text("Duration")) {
                    DurationPicker(duration: $duration, options: [30, 45, 60, 90])
                }
                Section(header: Text("Apps")) {
                    AppSelectionList(selectedApps: $selectedApps)
                }
            }
            .navigationTitle("Deep Search")
        }
    }
} 