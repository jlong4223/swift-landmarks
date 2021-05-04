//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Jared  Long on 5/2/21.
//

import SwiftUI

//this view is for creating what each row is going to look like
struct LandmarkRow: View {
//    assigning a variable to the landmarks[Landmark] array created in the model
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
//            adding a star if its a favorite
            if landmark.isFavorite {
                           Image(systemName: "star.fill")
                               .foregroundColor(.yellow)
                       }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
//        group is a container for grouping view content
        Group{
            LandmarkRow(landmark: landmarksArray[0])
            LandmarkRow(landmark: landmarksArray[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
