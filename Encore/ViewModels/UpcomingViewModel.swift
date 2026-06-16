//
        //
    //  Project: Encore
    //  File: UpcomingViewModel.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    
import Foundation
import SwiftData

@Observable
final class UpcomingViewModel {
    var showingAddSheet = false
    var showToMarkAttended: Show?
    var pendingRating = 0
    
    func filteredShows(_ shows: [Show]) -> [Show] {
        shows
            .filter { $0.status == .upcoming }
            .sorted { $0.date < $1.date }
    }
    
    func delete(_ show: Show, context: ModelContext) {
        context.delete(show)
    }
    
    func markAsAttended(_ show: Show) {
        show.status = .attended
        show.rating = pendingRating > 0 ? pendingRating : nil
        pendingRating = 0
        showToMarkAttended = nil
    }
}
