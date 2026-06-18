//
        //
    //  Project: Encore
    //  File: MainTabView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

/// Root tab container with Attended, Upcoming, and Settings tabs.
struct MainTabView: View {
    var body: some View {
    
        TabView {
            Tab("Attended", systemImage: "music.mic") {
                AttendedView()
            }
            Tab("Upcoming", systemImage: "calendar") {
                UpcomingView()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
        
        
    }
}

