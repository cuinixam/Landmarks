//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 14.01.24.
//

import SwiftUI

struct LandmarkList: View {
    // State is a value, or a set of values, that can change over time, and that affects a view's behaviour, content or layout.
    // Does this mean that variable marked as state are monitored and in case they get changed the view are automatically updated?
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            // List work with identifiables. We provide the .id to be used as identifible (it must be unique).
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
