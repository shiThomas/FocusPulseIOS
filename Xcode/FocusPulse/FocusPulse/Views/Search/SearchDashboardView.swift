import SwiftUI

struct SearchDashboardView: View {
    @AppStorage("quickSearchDuration") private var quickSearchDuration: TimeInterval = 300
    @AppStorage("deepSearchDuration") private var deepSearchDuration: TimeInterval = 1800
    @State private var quickSearchApps: Set<String> = ["Safari"]
    @State private var deepSearchApps: Set<String> = ["Safari"]
    @State private var selectedMode: SearchMode = .quick
    @State private var isSearchActive = false
    @State private var showError = false
    @State private var errorMessage = ""
    
    // Add UserDefaults observers
    init() {
        if let quickApps = UserDefaults.standard.stringArray(forKey: "quickSearchApps") {
            _quickSearchApps = State(initialValue: Set(quickApps))
        }
        if let deepApps = UserDefaults.standard.stringArray(forKey: "deepSearchApps") {
            _deepSearchApps = State(initialValue: Set(deepApps))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                SearchModePicker(selectedMode: $selectedMode)
                CurrentSettingsDisplay(selectedMode: selectedMode)
                StartSearchButton(action: startSearch)
                
                // Add test buttons
                Button("Test Safari") {
                    print("Testing Safari launch...")
                    if let scheme = AppLauncher.getUrlScheme(for: "Safari") {
                        print("Safari scheme: \(scheme)")
                        AppLauncher.launchApp(scheme)
                    }
                }
                .buttonStyle(.bordered)
                
                Button("Test Chrome") {
                    print("Testing Chrome launch...")
                    if let scheme = AppLauncher.getUrlScheme(for: "Chrome") {
                        print("Chrome scheme: \(scheme)")
                        AppLauncher.launchApp(scheme)
                    }
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .navigationTitle("Search")
            .onAppear {
                print("Current quick search apps: \(quickSearchApps)")
                print("Current deep search apps: \(deepSearchApps)")
            }
        }
        .onChange(of: quickSearchApps) { oldValue, newValue in
            print("Quick search apps changed from \(oldValue) to \(newValue)")
            UserDefaults.standard.set(Array(newValue), forKey: "quickSearchApps")
        }
        .onChange(of: deepSearchApps) { oldValue, newValue in
            print("Deep search apps changed from \(oldValue) to \(newValue)")
            UserDefaults.standard.set(Array(newValue), forKey: "deepSearchApps")
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    private func startSearch() {
        print("\n=== Starting Search ===")
        print("Selected mode: \(selectedMode)")
        isSearchActive = true
        let selectedApps = selectedMode == .quick ? quickSearchApps : deepSearchApps
        
        print("Selected apps: \(selectedApps)")
        var launchedApps = false
        
        // Launch each selected app
        for app in selectedApps {
            print("\nTrying to launch: \(app)")
            if let urlScheme = AppLauncher.getUrlScheme(for: app) {
                print("Got URL scheme for \(app): \(urlScheme)")
                AppLauncher.launchApp(urlScheme)
                launchedApps = true
            } else {
                print("❌ No URL scheme found for \(app)")
            }
        }
        
        if !launchedApps {
            print("❌ No apps were launched")
            errorMessage = "No apps could be launched. Please check your settings."
            showError = true
            return
        }
        
        // Start the timer for the selected duration
        let duration = selectedMode == .quick ? quickSearchDuration : deepSearchDuration
        print("Starting timer for \(duration) seconds")
        startTimer(duration: duration)
    }
    
    private func startTimer(duration: TimeInterval) {
        // Implementation for starting the timer
        // This will be implemented when we add the timer functionality
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            isSearchActive = false
            // Add any completion handling here
        }
    }
}

// Remove all component declarations from here 