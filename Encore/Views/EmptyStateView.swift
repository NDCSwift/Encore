//
        //
    //  Project: Encore
    //  File: EmptyStateView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    var body: some View {
        
        
        ContentUnavailableView(title, systemImage: icon, description: Text(message))
    }
}

