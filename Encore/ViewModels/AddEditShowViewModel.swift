//
        //
    //  Project: Encore
    //  File: AddEditShowViewModel.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftData
import Foundation


/// Backing state for AddEditShowView. Handles both creating new shows and editing existing ones.
@Observable
final class AddEditShowViewModel {

    var artistName = ""
    var venumeName = ""
    var city = ""
    var date = Date()
    var status: ShowStatus = .upcoming
    var rating: Int = 0
    var notes = ""
    var setlist: [String] = []
    var newSetlistEntry = ""

    // Requires at least artist and venue before saving
    var isValid: Bool {
        !artistName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !venumeName.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    // When editing, populates from the existing show; when creating, sets sensible date defaults per status
    init(show: Show? = nil, initialStatus: ShowStatus = .upcoming){
        if let show {
            artistName = show.artistName
            venumeName = show.venueName
            city = show.city
            date = show.date
            status = show.status
            rating = show.rating ?? 0
            notes = show.notes ?? ""
            setlist = show.setlist
        } else {
            status = initialStatus
            date = initialStatus == .attended ? .now : Calendar.current.date(byAdding: .day, value: 7, to: .now) ?? .now
        }
    }
    
    
    func addSetlistEntry() {
        let trimmed = newSetlistEntry.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        setlist.append(trimmed)
        newSetlistEntry = ""
    }
    
    // Updates in place if editing, inserts a new model if creating
    func save(to context: ModelContext, existing show: Show? = nil) {
        if let show {
            show.artistName = artistName
            show.venueName = venumeName
            show.city = city
            show.date = date
            show.status = status
            show.rating = rating > 0 ? rating : nil
            show.notes = notes.isEmpty ? nil : notes
            show.setlist = setlist
        }
        else {
            let newShow = Show(artistName: artistName, venueName: venumeName, city: city, date: date, status: status)
            newShow.rating = rating > 0 ? rating : nil
            newShow.notes = notes.isEmpty ? nil : notes
            newShow.setlist = setlist
            context.insert(newShow)
        }
    }
    
}
