//
//  ModelData.swift
//  Landmarks
//
//  Created by Jared  Long on 5/1/21.
//

import Foundation
import Combine

//combine allows the use of an observable object
//swiftui observes this object and updates views based on changes
final class ModelData: ObservableObject{
    // creating an array of landmarks by loading the json file and follows the model of Landmark which is defined in the Landmark.swift model
//    published allows users to see the changes- swift "publishes" the changes
    @Published var landmarksArray: [Landmark] = load("landmarkData.json")
    var hikesArray: [Hike] = load("hikeData.json")
}

// creating the load function that will handle the file passed into it, which is defined above
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

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
