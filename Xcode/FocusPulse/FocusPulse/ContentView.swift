//
//  ContentView.swift
//  FocusPulse
//
//  Created by Weicheng  Shi on 2/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SearchDashboardView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(0)
            
            FocusView()
                .tabItem {
                    Label("Focus", systemImage: "brain.head.profile")
                }
                .tag(1)
            
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
                .tag(2)
            
            RewardsView()
                .tabItem {
                    Label("Rewards", systemImage: "trophy.fill")
                }
                .tag(3)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
    }
}

struct SearchDashboardView: View {
    @State private var selectedMode: SearchMode = .quick
    @State private var selectedApps: Set<String> = []
    @State private var timeRemaining: TimeInterval = 0
    
    enum SearchMode {
        case quick, deep
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Search Mode Selector
                Picker("Search Mode", selection: $selectedMode) {
                    Text("Quick Search").tag(SearchMode.quick)
                    Text("Deep Search").tag(SearchMode.deep)
                }
                .pickerStyle(.segmented)
                .padding()
                
                // Time Selection
                TimeSelectionView(timeRemaining: $timeRemaining, mode: selectedMode)
                
                // App Selection
                AppSelectionView(selectedApps: $selectedApps)
                
                // Start Button
                Button(action: startSearch) {
                    Text("Start Search")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
    
    private func startSearch() {
        // Implementation for starting the search timer
    }
}

struct TimeSelectionView: View {
    @Binding var timeRemaining: TimeInterval
    let mode: SearchDashboardView.SearchMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Duration")
                .font(.headline)
            
            let options = mode == .quick ? 
                [5, 10, 15, 20] : [30, 45, 60, 90]
            
            HStack {
                ForEach(options, id: \.self) { minutes in
                    Button(action: { timeRemaining = Double(minutes * 60) }) {
                        Text("\(minutes)m")
                            .padding()
                            .background(
                                timeRemaining == Double(minutes * 60) ?
                                    Color.blue : Color.gray.opacity(0.2)
                            )
                            .foregroundColor(
                                timeRemaining == Double(minutes * 60) ?
                                    .white : .primary
                            )
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
    }
}

struct AppSelectionView: View {
    @Binding var selectedApps: Set<String>
    
    // Sample apps - in real app, fetch from system
    let availableApps = ["Safari", "Chrome", "Mail", "Messages"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select Apps")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(availableApps, id: \.self) { app in
                        AppToggleButton(
                            app: app,
                            isSelected: selectedApps.contains(app),
                            action: { toggleApp(app) }
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }
    
    private func toggleApp(_ app: String) {
        if selectedApps.contains(app) {
            selectedApps.remove(app)
        } else {
            selectedApps.insert(app)
        }
    }
}

struct AppToggleButton: View {
    let app: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(app)
                .padding()
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(8)
        }
    }
}

// Placeholder views for other tabs
struct FocusView: View {
    var body: some View {
        NavigationView {
            Text("Focus Features Coming Soon")
                .navigationTitle("Focus")
        }
    }
}

struct StatsView: View {
    var body: some View {
        NavigationView {
            Text("Statistics Coming Soon")
                .navigationTitle("Stats")
        }
    }
}

struct RewardsView: View {
    var body: some View {
        NavigationView {
            Text("Rewards Coming Soon")
                .navigationTitle("Rewards")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Settings Coming Soon")
                .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
