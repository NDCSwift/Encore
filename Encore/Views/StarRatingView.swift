//
        //
    //  Project: Encore
    //  File: StarRatingView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    private let maxRating = 5
    var body: some View {
        HStack {
            ForEach(1 ... maxRating, id: \.self){ star in
                Button {
                    withAnimation(.spring(response: 0.5)) {
                        rating = rating == star ? 0 : star
                    }
                }
                label : {
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .font(.title2)
                        .foregroundStyle(star <= rating ? Color.yellow : Color.secondary)
                        .scaleEffect(star <= rating ? 1.1 : 1.0)
                        .animation(.spring(response: 0.5), value: rating)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    StarRatingView(rating: .constant(4))
}
