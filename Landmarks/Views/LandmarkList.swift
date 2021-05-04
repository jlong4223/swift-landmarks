//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jared  Long on 5/3/21.
//

import SwiftUI

//this view is for creating the list of the already created rows
struct LandmarkList: View {
    
//    using the environment object says that the value is coming from the swiftui environment and not created by this view - modelData is getting the ModelData data which comes from the model
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
//    creating filteredArray to show favs or not
    var filteredLandmarks: [Landmark]{
        modelData.landmarksArray.filter {landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        
        NavigationView{
//        dynamically creating a list of landmarks from the filtered array and creating a row for each - basically looping the array
            List{
//                creates a toggle button to show and change favorites; the $ binds to the state variable
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){ landmark in
//                Creating a nav link for each landmark that renders the details 
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                    }
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
                    .environmentObject(ModelData())
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
               }
    }
}
