//
        //
    //  Project: Encore
    //  File: UpcomingView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI
import SwiftData

struct UpcomingView: View {
    @Query(sort: \Show.date) private var allShows: [Show]
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = UpcomingViewModel()
    var body: some View {
        @Bindable var vm = viewModel
        
        NavigationStack {
            Group{
                if viewModel.filteredShows(allShows).isEmpty {
                    ContentUnavailableView("No Upcoming Shows", systemImage: "calendar")
                } else {
                    List{
                        ForEach(viewModel.filteredShows(allShows)) { show in
                        
                            NavigationLink(value: show){
                                ShowRowView(show: show)
                            }
                            
                            .swipeActions(edge: .leading) {
                                Button("Attend"){
                                    viewModel.showToMarkAttended = show
                                }
                                .tint(.green)
                            }
                        }
                        .onDelete {
                            indexSet in
                            
                            let shows = viewModel.filteredShows(allShows)
                            for index in indexSet {
                                viewModel.delete(shows[index], context: modelContext)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Upcoming")
            .navigationDestination(for: Show.self) {
                show in
                // ShowDetailView
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button("Add Show", systemImage: "plus"){
                        viewModel.showingAddSheet = true
                    }
                }
            }
            .sheet(isPresented: $vm.showingAddSheet) {
                AddEditShowView(initialStatus: .upcoming)
            }
            .sheet(item: $vm.showToMarkAttended) {
                show in
                MarkAttendedSheet(show: show, viewModel: viewModel)
            }
            
        }
        
    }
}

#Preview {
    UpcomingView()
        .modelContainer(for: Show.self, inMemory: true)
}
