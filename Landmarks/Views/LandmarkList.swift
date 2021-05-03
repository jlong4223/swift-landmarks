//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jared  Long on 5/3/21.
//

import SwiftUI

//this view is for creating the list of the already created rows
struct LandmarkList: View {
    var body: some View {
        
        NavigationView{
//        dynamically creating a list of landmarks from the array and creating a row for each - basically looping the array
            List(landmarksArray){ landmark in
//                Creating a nav link for each landmark that renders the details 
                NavigationLink(destination: LandmarkDetail()){
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
