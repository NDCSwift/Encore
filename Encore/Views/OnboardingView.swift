//
        //
    //  Project: Encore
    //  File: OnboardingView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import UserNotifications

/// Multi-page onboarding flow shown on first launch. Writes to AppStorage on completion to gate future launches.
struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var currentPage = 0
    @State private var notificationsRequested = false

    // Static content for the first three slides; the notifications page is appended separately
    private let pages: [(icon: String, color: Color, title: String, description: String)] = [
        ("ticket.fill", .purple, "Your Concert History", "Log every show you've been to. Build a record of your live music journey"),
        ("music.microphone.circle.fill", .pink, "Every Detail Captured", "Set lists, ratings, notes - everything that made each night unforgettable."),
        ("calendar", .blue, "Never miss a show", "Save upcoming concerts and keep track of what's on your radar")
    ]
    private var isLastPage: Bool {
        currentPage == pages.count
    }
    
    // Last page completes onboarding; all others animate to the next page
    private func advance() {
        if isLastPage {
            hasCompletedOnboarding = true
        } else {
            withAnimation { currentPage += 1 }
        }
    }
    
    var body: some View {
        
        VStack {
            TabView(selection: $currentPage) {
                ForEach(pages.indices, id:\.self) { index in
                    
                    OnboardingPageView(icon: pages[index].icon,
                                       color: pages[index].color, title: pages[index].title, description: pages[index].description
            )
                        .tag(index)
                    
                }
                OnboardingNotificationsPage(notificationsRequested: $notificationsRequested)
                    .tag(pages.count)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .animation(.easeInOut, value: currentPage)
            
            Button(action: advance) {
                Text(isLastPage ? "Let's go" : "Continue")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
            }
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
        
    }
}

#Preview {
    OnboardingView()
}
