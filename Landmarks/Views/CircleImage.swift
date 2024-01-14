//
//  CircleImage.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 13.01.24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock").clipShape(Circle()).overlay {
            Circle().stroke(.white, lineWidth: 7)
        }
        .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
