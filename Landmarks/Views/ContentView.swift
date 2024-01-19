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
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
