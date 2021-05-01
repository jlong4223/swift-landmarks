//
//  Landmark.swift
//  Landmarks
//
//  Created by Jared  Long on 5/1/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
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
