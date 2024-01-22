//
//  Landmark.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 14.01.24.
//

import Foundation
// Needed for Image
import SwiftUI
// Needed for the map coordinates
import CoreLocation

// Addding Codable conformance makes it easier to move data between the structure and a data file
// The original name is stored in a json file. We will rely on the Decodable component of the Codable
// protocol to read data from the file
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int // required by the Identifiable protocol
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // we do not want to expose the imageName
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // this property is private because it is only used to create a public computed property
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
