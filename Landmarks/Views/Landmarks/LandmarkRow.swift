//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 14.01.24.
//

import SwiftUI

struct LandmarkRow: View {
    
    // As soon as I added this variable, I had to modify the call of LandmarkRow in the preview. It seems that the variables in the view are automatically added to the constructor
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                // System images are vector based therefore one can change their color
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
