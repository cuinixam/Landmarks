//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 14.01.24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // List work with identifiables. We provide the .id to be used as identifible (it must be unique).
        List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
}
