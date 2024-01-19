//
//  FavoriteButton.swift
//  LandmarksUITests
//
//  Created by Alexandru Maxiniuc on 19.01.24.
//

import SwiftUI

struct FavoriteButton: View {
    // The binding property wrapper enables read/write between a property that stores the data and a view that displays and changes the data.
    @Binding var isSet: Bool
    var body: some View {
        Button { 
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    // If the variable is a binding, one can use the .constant to provide a fixed value.
    FavoriteButton(isSet: .constant(false))
}
