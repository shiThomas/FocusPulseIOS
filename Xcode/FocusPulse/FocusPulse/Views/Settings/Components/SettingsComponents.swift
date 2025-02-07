import SwiftUI

struct DurationPicker: View {
    @Binding var duration: TimeInterval
    let options: [Int]
    
    var body: some View {
        ForEach(options, id: \.self) { minutes in
            let timeInterval = Double(minutes * 60)
            HStack {
                Text("\(minutes) minutes")
                Spacer()
                if duration == timeInterval {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                duration = timeInterval
            }
        }
    }
}

struct AppSelectionList: View {
    @Binding var selectedApps: Set<String>
    let availableApps = ["Safari", "Chrome", "Mail", "Messages"]
    
    var body: some View {
        ForEach(availableApps, id: \.self) { app in
            HStack {
                Text(app)
                Spacer()
                if selectedApps.contains(app) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                if selectedApps.contains(app) {
                    selectedApps.remove(app)
                } else {
                    selectedApps.insert(app)
                }
            }
        }
    }
} 