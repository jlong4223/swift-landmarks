//
//  Hike.swift
//  Landmarks
//
//  Created by Jared  Long on 5/14/21.
//

import Foundation

//Hike structure conforms to Codable and has properties that match the keys in the corresponding data file, which is hikeData.json
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter()
    
    var distanceText: String{
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable{
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
