//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Jared  Long on 5/3/21.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
//  using Vstack to vertically stack the text views
        VStack{
//            rendering the other views by calling them within the vStack
            MapView()
//                adding ignores safe area allows the map to extend to the top
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            PoolImage()
                .offset(y: -120)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Hamilton Pool Preserve")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Travis County Parks")
                    Spacer()
                    Text("Austin, TX")
                }
//                the below styles are attached to the stack so they will apply to all elements in the stack
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About Hamilton Pool")
                    .font(.title2)
                Spacer()
                Text("Hamilton Pool Preserve is a natural pool that was created when the dome of an underground river collapsed due to massive erosion thousands of years ago. The pool is located about 23 miles west of Austin, Texas off Highway 71")
                
                Spacer()
            }
            .padding()
            
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
