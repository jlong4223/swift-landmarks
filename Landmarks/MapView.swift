//
//  MapView.swift
//  Landmarks
//
//  Created by Jared  Long on 5/1/21.
//

import SwiftUI
//imports MapKit necessary for map
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 30.34227, longitude:  -98.12693),
//        the delta value changes the zoom level
        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    )
    var body: some View {
//        binding the view to the value of the state var - this will update when the user interacts with the map
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
