//
//  ContentView.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 13.01.24.
//

import SwiftUI

struct ContentView: View {
    // The body property only returns a single View
    var body: some View {
        VStack {
            MapView().frame(height: 300)
            CircleImage()
                .offset(y: -130)
                // Set the distance to the bottom of the view
                .padding(.bottom, -130)
            // Align the Views by their leading edges
            VStack(alignment: .leading) {
                Text("Turtle Rock").font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    // Use the full width of the device. Expand to use all of the space of its parent view
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Divider()
                Text("About the Turtle Rock").font(.title2)
                Text("Turtle Rock, found in Joshua Tree National Park, is a striking geological formation resembling a weathered turtle shell. Its smooth curves and unique shape make it a captivating sight in the desert landscape, inviting visitors to marvel at the wonders of nature. As the sun sets, Turtle Rock takes on an enchanting glow, providing a serene and memorable experience for those exploring the park's beauty.")
            }	
            // Give a little more space around the outer edges
            .padding()
            // Add a spacer to push the content to the top of the screen
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
