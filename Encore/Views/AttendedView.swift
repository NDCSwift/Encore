//
        //
    //  Project: Encore
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import SwiftData


struct AttendedView: View {
    @Query private var shows: [Show]
    @Environment(\.modelContext) private var modelContext
    var body: some View {

        NavigationStack {
            List(shows) { show in
                Text(show.artistName)
                
            }
            .navigationTitle("Attended")
            .toolbar{
                Button("Add show!", systemImage: "plus") {
                    modelContext.insert(Show(artistName: "Radiohead", venueName: "Madison Square Garden", city: "New York", date: .now, status: .attended))
                }
            }
        }
        
        
    }
}

#Preview {
    AttendedView()
        .modelContainer(for: Show.self, inMemory: true)
}
