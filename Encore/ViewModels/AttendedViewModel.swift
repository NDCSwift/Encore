//
        //
    //  Project: Encore
    //  File: AttendedViewModel.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import Foundation

@Observable
final class AttendedViewModel {
    var searchText = ""
    var showingAddSheet = false
    
    func filteredShows(_ shows: [Show]) -> [Show] {
        let attended = shows.filter({ $0.status == .attended })
        guard !searchText.isEmpty else { return attended }
        return attended.filter {
            $0.artistName.localizedCaseInsensitiveContains(searchText) || $0.venueName.localizedCaseInsensitiveContains(searchText) || $0.city.localizedCaseInsensitiveContains(searchText)
        }
    }
}
