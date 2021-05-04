//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jared  Long on 5/3/21.
//

import SwiftUI

//this view is for creating the list of the already created rows
struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
//    creating filteredArray to show favs or not
    var filteredLandmarks: [Landmark]{
        landmarksArray.filter {landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        
        NavigationView{
//        dynamically creating a list of landmarks from the filtered array and creating a row for each - basically looping the array
            List(filteredLandmarks){ landmark in
//                Creating a nav link for each landmark that renders the details 
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        this provides a preview of each phone listed in the array
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPhone 11 Pro"], id: \.self) { deviceName in
                   LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
               }
    }
}
