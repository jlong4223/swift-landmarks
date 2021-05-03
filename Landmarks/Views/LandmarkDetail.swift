//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Jared  Long on 5/3/21.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
//  using Vstack to vertically stack the text views
        ScrollView{
//            rendering the other views by calling them within the vStack
            MapView(coordinate: landmark.locationCoordinate)
//                adding ignores safe area allows the map to extend to the top
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            PoolImage(image: landmark.image)
                .offset(y: -120)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
//                the below styles are attached to the stack so they will apply to all elements in the stack
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Spacer()
                Text(landmark.description)
                
//                Spacer()
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarksArray[0])
    }
}
