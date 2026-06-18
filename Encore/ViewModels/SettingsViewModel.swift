//
        //
    //  Project: Encore
    //  File: SettingsViewModel.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftData
import UserNotifications
import Foundation

/// Computes stats and handles notification permission for the Settings tab.
@Observable
final class SettingsViewModel {
    var notificationsEnabled = false
    
    func attendedCount(_ shows: [Show]) -> Int {
        shows.filter { $0.status == .attended }.count
    }
    
    func upcomingCount(_ shows: [Show]) -> Int {
        shows.filter { $0.status == .upcoming }.count
    }
    
    func seenThisYear(_ shows: [Show]) -> Int {
        let year = Calendar.current.component(.year, from: .now)
        return shows.filter { $0.status == .attended && Calendar.current.component(.year, from: $0.date) == year }.count
    }
    
    func topArtist(_ shows: [Show]) -> String? {
        let attended = shows.filter { $0.status == .attended }
        let counts = Dictionary(grouping: attended, by: \.artistName)
            .mapValues(\.count)
        return counts.max { $0.value < $1.value }?.key
    }
    
    // Formats attended shows as plain text for the share sheet
    func exportText(_ shows: [Show]) -> String {
        let attended = shows
            .filter { $0.status == .attended }
            .sorted { $0.date > $1.date }
        guard !attended.isEmpty else { return "No Shows Logged" }
        
        let lines = attended.map { show in
            let date = show.date.formatted(.dateTime.month().day().year())
            return "\(date) - \(show.artistName) at \(show.venueName), \(show.city)"
        }
        return "My Encore Concert History\n\n" + lines.joined(separator: "\n")
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            granted, _ in
            // Permission callback arrives on a background thread; hop back to main for @Observable mutation
            DispatchQueue.main.async {
                self.notificationsEnabled = granted
            }
        }
    }

    func checkNotificationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            // Same threading requirement as requestNotificationPermission
            DispatchQueue.main.async {
                self.notificationsEnabled = settings.authorizationStatus == .authorized
            }
            
        }
    }
    
}
