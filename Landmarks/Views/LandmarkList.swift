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
        List{
            LandmarkRow(landmark: landmarksArray[0])
            LandmarkRow(landmark: landmarksArray[1])
            LandmarkRow(landmark: landmarksArray[2])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
