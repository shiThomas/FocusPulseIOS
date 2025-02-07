import SwiftUI

struct SearchModePicker: View {
    @Binding var selectedMode: SearchMode
    
    var body: some View {
        Picker("Search Mode", selection: $selectedMode) {
            Text("Quick Search").tag(SearchMode.quick)
            Text("Deep Search").tag(SearchMode.deep)
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

struct CurrentSettingsDisplay: View {
    let selectedMode: SearchMode
    @AppStorage("quickSearchDuration") private var quickSearchDuration: TimeInterval = 300
    @AppStorage("deepSearchDuration") private var deepSearchDuration: TimeInterval = 1800
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 8) {
                Text("Duration: \(Int(currentDuration / 60)) minutes")
                Text("Selected Apps: \(selectedAppsText)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
    
    private var currentDuration: TimeInterval {
        selectedMode == .quick ? quickSearchDuration : deepSearchDuration
    }
    
    private var selectedAppsText: String {
        let apps = selectedMode == .quick ? 
            UserDefaults.standard.stringArray(forKey: "quickSearchApps") ?? ["Safari"] :
            UserDefaults.standard.stringArray(forKey: "deepSearchApps") ?? ["Safari"]
        return apps.joined(separator: ", ")
    }
}

struct StartSearchButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Start Search")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
} 