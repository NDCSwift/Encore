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

struct AttendedView: View {
    @State private var shows: [Show] = []
    var body: some View {

        NavigationStack {
            List(shows) { show in
                Text(show.artistName)
                
            }
            .navigationTitle("Attended")
            .toolbar{
                Button("Add show!", systemImage: "plus") {
                    shows.append(Show(artistName: "Radiohead", venueName: "Madison Square Garden", city: "New York", date: .now, status: .attended))
                }
            }
        }
        
        
    }
}

#Preview {
    AttendedView()
}
