//
//  MapView.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 13.01.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [place]
        ){
            somePlace in
            MapMarker(coordinate: somePlace.coordinate, tint: .red)
          }
    }
    
    @State private var region =
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2
                                   , longitudeDelta: 0.2)
        )
    
    
    struct Place: Identifiable {
            let id = UUID()
            let name: String
            let coordinate: CLLocationCoordinate2D
        }
    
   @State private var place = Place(name: "Turtle Rock", coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))

}

#Preview {
    MapView()
}
