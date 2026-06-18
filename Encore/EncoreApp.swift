//
        //
    //  Project: Encore
    //  File: EncoreApp.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import SwiftData

/// App entry point. Routes to onboarding or the main tab interface based on AppStorage.
@main
struct EncoreApp: App {
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(for: Show.self)
    }
}
