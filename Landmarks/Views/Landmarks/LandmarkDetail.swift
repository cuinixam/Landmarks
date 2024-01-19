//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 17.01.24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData
        // Use a scroll view so the user can scroll through the content
        ScrollView {
            MapView(name: landmark.name, coordinate: landmark.locationCoordinate).frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                // Set the distance to the bottom of the view
                .padding(.bottom, -130)
            // Align the Views by their leading edges
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    // Use the full width of the device. Expand to use all of the space of its parent view
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About the \(landmark.park)").font(.title2)
                Text(landmark.description)
            }
            // Give a little more space around the outer edges
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
