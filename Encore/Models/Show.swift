//
        //
    //  Project: Encore
    //  File: Show.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import Foundation
import SwiftData
import SwiftUI

enum ShowStatus: String, Codable, CaseIterable {
    case attended
    case upcoming
    
}

@Model
final class Show {
    
    var artistName: String
    var venueName: String
    var city: String
    var date: Date
    var status: ShowStatus
    
    var rating: Int?
    var notes: String?
    var setlist: [String]
    var createdAt: Date
    
    init(artistName: String, venueName: String, city: String, date: Date, status: ShowStatus) {
        self.artistName = artistName
        self.venueName = venueName
        self.city = city
        self.date = date
        self.status = status
        self.rating = nil
        self.notes = nil
        self.setlist = []
        self.createdAt = .now
    }
}



#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Show.self, configurations: config)
    
    let sample = Show(artistName: "MGK", venueName: "Coke Arena", city: "Toronto", date: .now, status: .attended)
    container.mainContext.insert(sample)
    
    return Text(sample.artistName)
        .modelContainer(container)
}
