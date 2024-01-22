//
//  ModelData.swift
//  Landmarks
//
//  Created by Alexandru Maxiniuc on 14.01.24.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var categories : [String: [Landmark]] {
        // Group the landmarks based on their category name
        Dictionary(grouping: landmarks, by: {$0.category.rawValue})
    }
}


// This is a Swift function named "load".
// It's designed to read and decode data from a file.
// <T: Decodable> means it can work with any data type (generic), as long as that type conforms to the "Decodable" protocol.
// The "Decodable" protocol allows data to be converted from its stored format, like JSON, into Swift objects.
// "filename" is a parameter, which is a String that represents the name of the file we want to read.
// Using the '_' in front of the argument name implies that this is not a named argument and one can
// call the method like 'load("data.json")'
// The "-> T" part indicates that the function will return a result of type "T" after decoding the data.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // guard is used for early exit from a scope (typically a function) when a certain condition is not met.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
