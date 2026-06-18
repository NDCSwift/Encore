//
        //
    //  Project: Encore
    //  File: OnboardingPageView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

/// Reusable template for a single onboarding slide (icon, title, description).
struct OnboardingPageView: View {
    let icon: String
    let color: Color
    let title: String
    let description: String
    var body: some View {
        
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: icon)
                .font(.system(size: 90))
                .foregroundStyle(color)
            Text(title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Text(description)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    OnboardingPageView(icon: "plus", color: .blue, title: "Test", description: "Testing")
}
