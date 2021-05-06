//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Jared  Long on 5/3/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
            modelData.landmarksArray.firstIndex(where: { $0.id == landmark.id })!
        }
    
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
                HStack {
//                    bringing in the button next to the landmark name - sets the favorite to whatever idx is being previewed
                                    Text(landmark.name)
                                        .font(.title)
                                        .foregroundColor(.primary)
                                    FavButton(isSet: $modelData.landmarksArray[landmarkIndex].isFavorite)
                                }
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
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarksArray[0])
//            need access to the modelData again since its in an environment object
            .environmentObject(modelData)
    }
}
