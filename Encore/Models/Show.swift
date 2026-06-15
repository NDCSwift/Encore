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

enum ShowStatus {
    case attended
    case upcoming
    
}


struct Show: Identifiable {
    
    var artistName: String
    var venueName: String
    var city: String
    var date: Date
    var status: ShowStatus
    
    let id = UUID()
}
