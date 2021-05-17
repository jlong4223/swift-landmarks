//
//  Landmark.swift
//  Landmarks
//
//  Created by Jared  Long on 5/1/21.
//

import Foundation
import SwiftUI
import CoreLocation

// adds identifiable so the landmark can be read based on id for the key
struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
//    definining category for seperating how they are viewed
// Category can contain more than strings if there were other types
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
//    making private as it is not info that the user cares to see but is needed for the image to show
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    struct Coordinates: Hashable, Codable{
//        double is used as there is a floating point in the integer
        var latitude: Double
        var longitude: Double
    }
}
