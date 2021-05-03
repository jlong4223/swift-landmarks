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
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

    var body: some View {
//        binding the view to the value of the state var - this will update when the user interacts with the map
        Map(coordinateRegion: $region)
                   .onAppear {
                       setRegion(coordinate)
                   }
           }
//    changing the reqion based on what coordinates are read
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
//        giving the coordinate data as default but changes upon location clicked
        MapView(coordinate: CLLocationCoordinate2D(latitude: 30.34227, longitude:  -98.12693))
    }
}
