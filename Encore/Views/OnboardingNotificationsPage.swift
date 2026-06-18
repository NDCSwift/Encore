//
        //
    //  Project: Encore
    //  File: OnboardingNotificationsPage.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import UserNotifications

/// Final onboarding page that requests notification permissions. Binding lets OnboardingView track whether permission was requested.
struct OnboardingNotificationsPage: View {
    @Binding var notificationsRequested: Bool
    var body: some View {
        
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: "bell.circle.fill")
                .font(.system(size: 90))
                .foregroundStyle(.orange)
            Text("Show Reminders")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Text("Get notified before upcoming shows so you're always ready!")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            if notificationsRequested {
                Label("You're all set!", systemImage: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                    .font(.headline)
            } else {
                Button("Enable Notifications") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                        granted, _ in
                        
                        DispatchQueue.main.async {
                            notificationsRequested = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
            Spacer()
        }
        .padding()
    }
}
