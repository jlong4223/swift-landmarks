//
//  ModelData.swift
//  Landmarks
//
//  Created by Jared  Long on 5/1/21.
//

import Foundation

// creating an array of landmarks by loading the json file
var landmarksArray: [Landmark] = load("landmarkData.json")

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
