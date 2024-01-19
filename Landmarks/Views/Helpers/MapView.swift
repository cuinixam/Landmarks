//
//  MapView.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 13.01.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var name: String
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        // Use a .constant binding because the MapView doesn't need to detect when someone changes the position by interacting with the map.
        Map(position: .constant(.region(region))) {
            Marker(name, coordinate: coordinate)
        }
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2
                                   , longitudeDelta: 0.2)
        )
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return MapView(name: landmarks[0].name, coordinate: landmarks[0].locationCoordinate)
}
