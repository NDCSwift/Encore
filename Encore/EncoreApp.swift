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

@main
struct EncoreApp: App {
    var body: some Scene {
        WindowGroup {
            AttendedView()
        }
        .modelContainer(for: Show.self)
    }
}
